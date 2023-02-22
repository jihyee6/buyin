package api.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class ShopBasketsDAO extends TotalDAO {
	
	public JSONObject searchShopBaskets(String user) {
		JSONObject info = new JSONObject();
		
		//////////////// common value //////////////////////
		List<String> common_colunmList = Arrays.asList(
				"(select lodgement_name from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = shopbaskets.room_id)) as lodgement_name",
				"lodge_type", "checkin_date", "checkout_date");
		
		HashMap<String, List<String>> common_condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
			put("just_reserve", Arrays.asList("value", "0"));
		}};
		
		String common_sql = select_query("shopbaskets", common_colunmList, common_condition_hashmap, null, null) + " limit 1";
		
		
		
		//////////////// before value /////////////////////////
		List<String> before_colunmList = Arrays.asList(
				"shopbasket_id", "room_id", "(select room_name from rooms where room_id = shopbaskets.room_id) as room_name", "reserve_price",
				"weekday_gift_count", "weekday_gift_price", "weekend_gift_count", "weekend_gift_price", "option_list", "amenity_list");
		
		HashMap<String, List<String>> before_condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
			put("just_reserve", Arrays.asList("value", "0"));
		}};
		
		String before_sql = select_query("shopbaskets", before_colunmList, before_condition_hashmap, null, null);
		
		
		
		//////////////// total gift ////////////////////////
		String weekday_gift_sql = String.format("select count(*) as weekday_gift_count from user_gifts "
				+ "where user_id = %s and room_id = ? and gift_type = 0 and use_date is null", makeString(user));
		
		String weekend_gift_sql = String.format("select count(*) as weekend_gift_count from user_gifts "
				+ "where user_id = %s and room_id = ? and gift_type = 1 and use_date is null", makeString(user));
		
		
		//////////////// room option ////////////////////////
		String option_sql = "select option_id, option_name, option_price from room_options where room_id = ?";
		
		
		//////////////// amenity //////////////////////////
		List<String> amenity_option_columnList = Arrays.asList(
				json_arrayagg_query(json_object_query(Arrays.asList(
						"amenity_option_id", "amenity_option_name",	"amenity_option_price"),
						Arrays.asList("'is_selected'","if(is_default, 'true', 'false')"))));
		
		HashMap<String, List<String>> amenity_option_condition_hashmap = new HashMap<>() {{
			put("amenity_id", Arrays.asList("value", "room_amenities.amenity_id"));
		}};
		
		String amenity_option_sql = select_query("room_amenity_options", amenity_option_columnList, amenity_option_condition_hashmap, null, null);
		String amenity_sql = String.format("select amenity_id, amenity_name, (%s) as amenity_options from room_amenities where room_id = ?", amenity_option_sql);
		
		conn();
		
		int lodgePeriod;
		int lodgeMonth;
		int weekday;
		int weekend;
		
		try {
			psmt = conn.prepareStatement(common_sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
			
				HashMap<String, Integer> dateMap = calculateDate(rs.getString("checkin_date"), rs.getString("checkout_date"));
				lodgePeriod = dateMap.get("lodgePeriod");
				lodgeMonth = dateMap.get("lodgeMonth");
				weekday = dateMap.get("weekday");
				weekend = dateMap.get("weekend");
				
				info.put("lodgement_name", rs.getString("lodgement_name"));
				
				if (rs.getBoolean("lodge_type")) {
					info.put("date_string", String.format("%s ~ %s, %d박", rs.getString("checkin_date"), rs.getString("checkout_date"), lodgePeriod));
					info.put("lodge_period", lodgePeriod);
				} else {
					info.put("date_string", String.format("%s ~ %s, 대실", rs.getString("checkin_date"), rs.getString("checkout_date")));
					info.put("lodge_period", 1);
				}
			} else {
				return null;
			}
			
			
			///////////////// before value //////////////////
			ArrayList<JSONObject> before_array = new ArrayList<>();
			
			psmt = conn.prepareStatement(before_sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JSONObject object = new JSONObject();
				
				object.put("shopbasket_id", rs.getInt("shopbasket_id"));
				object.put("room_id", rs.getInt("room_id"));
				object.put("room_name", rs.getString("room_name"));
				object.put("reserve_price", rs.getInt("reserve_price"));
				object.put("weekday_gift_count", rs.getInt("weekday_gift_count"));
				object.put("weekday_gift_price", rs.getInt("weekday_gift_price"));
				object.put("weekend_gift_count", rs.getInt("weekend_gift_count"));
				object.put("weekend_gift_price", rs.getInt("weekend_gift_price"));
				object.put("option_list", (JSONArray) JSONValue.parse(rs.getString("option_list")));
				object.put("amenity_list", (JSONArray) JSONValue.parse(rs.getString("amenity_list")));
				
				before_array.add(object);
			}
			
			//////////////////// total gift ////////////////////
			HashMap<Integer, List<Integer>> total_gift = new HashMap<>();
			
			
			/////////////////// return array ////////////////////
			JSONArray return_array = new JSONArray();
			
			for(int i=0; i < before_array.size(); i++) {
				JSONObject object = new JSONObject();
				
				object.put("shopbasket_id", before_array.get(i).get("shopbasket_id"));
				object.put("room_name", before_array.get(i).get("room_name"));
				object.put("reserve_price", before_array.get(i).get("reserve_price"));
				object.put("weekday_gift_price", before_array.get(i).get("weekday_gift_price"));
				object.put("weekend_gift_price", before_array.get(i).get("weekend_gift_price"));
				
				Integer room_id = (Integer) before_array.get(i).get("room_id");
				if(total_gift.get(room_id) == null) {
					psmt = conn.prepareStatement(weekday_gift_sql);
					psmt.setInt(1, room_id);
					rs = psmt.executeQuery();
					
					rs.next();
					int weekday_gift = rs.getInt("weekday_gift_count");
					
					psmt = conn.prepareStatement(weekend_gift_sql);
					psmt.setInt(1, room_id);
					rs = psmt.executeQuery();
					
					rs.next();
					int weekend_gift = rs.getInt("weekend_gift_count");
					
					total_gift.put(room_id, Arrays.asList(weekday_gift, weekend_gift));
				}
				
				object.put("weekday_gift_count", Integer.min(total_gift.get(room_id).get(0), weekday));
				object.put("weekend_gift_count", Integer.min(total_gift.get(room_id).get(1), weekend));
				
				total_gift.put(room_id, Arrays.asList(
						total_gift.get(room_id).get(0) - (Integer) object.get("weekday_gift_count"), 
						total_gift.get(room_id).get(1) - (Integer) object.get("weekend_gift_count")));
				
				object.put("weekday_using_gift", Integer.min((Integer) object.get("weekday_gift_count"), (Integer) before_array.get(i).get("weekday_gift_count")));
				object.put("weekend_using_gift", Integer.min((Integer) object.get("weekend_gift_count"), (Integer) before_array.get(i).get("weekend_gift_count")));
				
				
				//////////////////////// room option /////////////////////////
				JSONArray option_array = new JSONArray();
				
				psmt = conn.prepareStatement(option_sql);
				psmt.setInt(1, room_id);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					JSONObject option = new JSONObject();
					
					int option_id = rs.getInt("option_id");
					
					option.put("option_id", option_id);
					option.put("option_name", rs.getString("option_name"));
					option.put("option_price", rs.getInt("option_price"));
					option.put("option_count", 0);
					
					JSONArray before_option_list = (JSONArray) before_array.get(i).get("option_list");
					for(int o=0; o < before_option_list.size(); o++) {
						if(((JSONObject) before_option_list.get(o)).get("roomOptionID").equals(String.valueOf(option_id))) {
							option.put("option_count", ((JSONObject) before_option_list.get(o)).get("roomOptionCount"));
							break;
						}
					}
					
					option_array.add(option);
				}
				
				object.put("room_options", option_array);
				
				
				/////////////////////// amenity /////////////////////////////
				JSONArray amenity_array = new JSONArray();
				
				psmt = conn.prepareStatement(amenity_sql);
				psmt.setInt(1, room_id);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					JSONObject amenity = new JSONObject();
					
					int amenity_id = rs.getInt("amenity_id");
					JSONArray amenity_option_list = (JSONArray) JSONValue.parse(rs.getString("amenity_options") == null ? "[]" : rs.getString("amenity_options"));
					
					amenity.put("amenity_id", amenity_id);
					amenity.put("amenity_name", rs.getString("amenity_name"));
					amenity.put("amenity_options", amenity_option_list);
					
					JSONArray before_amenity_list = (JSONArray) before_array.get(i).get("amenity_list");
					for(int a=0; a < before_amenity_list.size(); a++) {
						if(((JSONObject) before_amenity_list.get(a)).get("amenityID").equals(String.valueOf(amenity_id))) {
							for(int ao=0; ao < amenity_option_list.size(); ao++) {
								if(((JSONObject) amenity_option_list.get(ao)).get("is_selected").equals("true")) {
									((JSONObject) amenity_option_list.get(ao)).put("is_selected", false);
									break;
								}
							}
							
							for(int ao=0; ao < amenity_option_list.size(); ao++) {
								if(((JSONObject) before_amenity_list.get(a)).get("amenityOptionID").equals(String.valueOf(((JSONObject) amenity_option_list.get(ao)).get("amenity_option_id")))) {
									((JSONObject) amenity_option_list.get(ao)).put("is_selected", true);
									break;
								}
							}
							break;
						}
					}
					
					amenity_array.add(amenity);
				}
				
				object.put("amenities", amenity_array);
				
				
				return_array.add(object);
			}
			
			info.put("shopbaskets", return_array);
			
			return info;
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
	}
	
	public String checkShopBasket(String room, String user, String lodgeType, String checkInDate, String checkOutDate) {
		List<String> colunmList = Arrays.asList(
				"(select lodgement_id from rooms where room_id = shopbaskets.room_id) as lodgement_id",
				"lodge_type", "checkin_date", "checkout_date");
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
			put("just_reserve", Arrays.asList("value", "0"));
		}};
		
		conn();
		
		String sql = select_query("shopbaskets", colunmList, condition_hashmap, null, null) + " limit 1";
		String lodgement_sql = "select lodgement_id from rooms where room_id = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				JSONObject jsonObject = makeJSONObject(Arrays.asList("int", "boolean", "string", "string"));
				
				psmt = conn.prepareStatement(lodgement_sql);
				psmt.setString(1, room);
				rs = psmt.executeQuery();
				
				rs.next();
				
				if(!jsonObject.get("lodgement_id").equals(rs.getInt("lodgement_id"))) {
					close();
					return "장바구니에 다른 숙소의 객실을 담을 수 없습니다.";
				}

				if(!jsonObject.get("lodge_type").equals(Boolean.parseBoolean(lodgeType))) {
					close();
					return "장바구니의 대실/숙박 여부가 동일해야 합니다.";
				}
				
				if(!jsonObject.get("checkin_date").equals(weekdayString(checkInDate)) || !jsonObject.get("checkout_date").equals(weekdayString(checkOutDate))) {
					close();
					return "장바구니의 숙박기간이 동일해야 합니다.";
				}
			}
			
			return "Success";
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			return "서버 오류 발생";
		}
	}
	
	public String addShopBasket(String room, String user, String lodgeType, String roomPrice, String checkIndate, String checkOutDate, 
			String weekdayGiftCount, String weekdayGiftPrice, String weekendGiftCount, String weekendGiftPrice, String roomOptions, 
			String amenities, String totalPrice, String reservePrice, String justReserve) {
		
		List<String> columnList = Arrays.asList("room_id", "user_id", "lodge_type", "room_price", "checkin_date", "checkout_date",
				"weekday_gift_count", "weekday_gift_price", "weekend_gift_count", "weekend_gift_price", "option_list", "amenity_list", 
				"total_price", "reserve_price", "just_reserve");
		
		List<String> valueList = Arrays.asList(room, makeString(user), lodgeType, roomPrice, makeString(weekdayString(checkIndate)), 
				makeString(weekdayString(checkOutDate)), weekdayGiftCount, weekdayGiftPrice, weekendGiftCount, weekendGiftPrice,
				json_array_insert((JSONArray) JSONValue.parse(roomOptions)), json_array_insert((JSONArray) JSONValue.parse(amenities)), 
				totalPrice, reservePrice, justReserve);
		for (String string : valueList) {
			System.out.println(string);
		}
		String sql = insert_query("shopbaskets", columnList, valueList, null, false);
		
		String delete_sql = "";
		if(justReserve.equals("true")) {
			HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
				put("user_id", Arrays.asList("value", makeString(user)));
				put("just_reserve", Arrays.asList("value", "1"));
			}};
			
			delete_sql = delete_query("shopbaskets", condition_hashmap);
			
			conn();
		}
		
		try {
			
			if(justReserve.equals("true")) {
				psmt = conn.prepareStatement(delete_sql);			
				psmt.executeUpdate();
			}
			
			psmt = conn.prepareStatement(sql);			
			psmt.executeUpdate();
			
			return "Success";
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return "서버 오류 발생";
		} finally {
			close();
		}		
	}
	
	public void updateShopBasket(String shopbasketID, String weekdayGiftCount, String weekendGiftCount, String roomOptions, String amenities, 
			String totalPrice, String reservePrice) {
		HashMap<String, String> column_value_hashmap = new HashMap<>() {{
			put("weekday_gift_count", weekdayGiftCount);
			put("weekend_gift_count", weekendGiftCount);
			put("option_list", json_array_insert((JSONArray) JSONValue.parse(roomOptions)));
			put("amenity_list", json_array_insert((JSONArray) JSONValue.parse(amenities)));
			put("total_price", totalPrice);
			put("reserve_price", reservePrice);
		}};
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("shopbasket_id", Arrays.asList("value", shopbasketID));
		}};
		
		String sql = update_query("shopbaskets", column_value_hashmap, condition_hashmap, false);
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(sql);			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void deleteShopBasket(String shopbasket) {
		String sql = "delete from shopbaskets where shopbasket_id = ?";
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, shopbasket);
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	private String weekdayString(String date) {
		String[] dateStringList = date.split(" ");
		List<Integer> dateList = Arrays.asList(dateStringList[0].split("\\.")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		Calendar dateCalendar = Calendar.getInstance();
		
		dateCalendar.set(dateList.get(0), dateList.get(1) - 1, dateList.get(2));
		
		int weekday = dateCalendar.get(Calendar.DAY_OF_WEEK);
		
		switch (weekday) {
			case 1:
				return String.format("%s (일) %s", dateStringList[0], dateStringList[1]);
			case 2:
				return String.format("%s (월) %s", dateStringList[0], dateStringList[1]);
			case 3:
				return String.format("%s (화) %s", dateStringList[0], dateStringList[1]);
			case 4:
				return String.format("%s (수) %s", dateStringList[0], dateStringList[1]);
			case 5:
				return String.format("%s (목) %s", dateStringList[0], dateStringList[1]);
			case 6:
				return String.format("%s (금) %s", dateStringList[0], dateStringList[1]);
			case 7:
				return String.format("%s (토) %s", dateStringList[0], dateStringList[1]);
			default:
				return null;
		}
	}
	
	private HashMap<String, Integer> calculateDate(String checkInDate, String checkOutDate) {
		
		HashMap<String, Integer> returnMap = new HashMap<String, Integer>();
		
		List<Integer> checkInList = Arrays.asList(checkInDate.split(" ")[0].split("\\.")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		List<Integer> checkOutList = Arrays.asList(checkOutDate.split(" ")[0].split("\\.")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		Calendar checkIn = Calendar.getInstance();
		Calendar checkOut = Calendar.getInstance();
		
		checkIn.set(checkInList.get(0), checkInList.get(1) - 1, checkInList.get(2));
		checkOut.set(checkOutList.get(0), checkOutList.get(1) - 1, checkOutList.get(2));
		
		//////////// lodgePeroid ///////////////
		
        int checkInYearDay = checkIn.get(Calendar.DAY_OF_YEAR);
        int checkOutYearDay = checkOut.get(Calendar.DAY_OF_YEAR);
        
        int lodgePeriod;
        
        if(checkInYearDay <= checkOutYearDay) {
        	lodgePeriod = checkOutYearDay - checkInYearDay; 
        }
        else {
        	Calendar lastDay = Calendar.getInstance();
        	lastDay.set(checkInList.get(0), 11, 31);
        	lodgePeriod = checkOutYearDay - checkInYearDay + lastDay.get(Calendar.DAY_OF_YEAR);
        }
        
        //////////// lodgeMonth ////////////////
        
        int lodgeMonth;
        
        if(checkInList.get(1) <= checkOutList.get(1)) {
        	lodgeMonth = checkOutList.get(1) - checkInList.get(1) + 1;
        } else {
        	lodgeMonth = checkOutList.get(1) - checkInList.get(1) + 13;
        }
        
        //////////// weekday, weekend count /////////////
        
        int checkinWeekDay = checkIn.get(Calendar.DAY_OF_WEEK) - 1;
        int week = lodgePeriod / 7;

        int weekday = 0;
        int weekend = 0;

        for (int i = checkinWeekDay; i < checkinWeekDay + lodgePeriod % 7; i++) {
            if (i % 7 < 5) weekday += 1;
            else weekend += 1;
        }

        weekday += (5 * week);
        weekend += (2 * week);
        
        returnMap.put("lodgePeriod", lodgePeriod);
        returnMap.put("lodgeMonth", lodgeMonth);
        returnMap.put("weekday", weekday);
        returnMap.put("weekend", weekend);
        
        return returnMap;
	}
}
