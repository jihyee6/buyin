package api.model;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class OptionsDAO extends TotalDAO {
	
	public JSONObject searchOptions(String user, String room, String checkInDate, String checkOutDate) {
		
		JSONObject info = new JSONObject();
		
		List<String> checkInList = Arrays.asList(checkInDate.split("\\."));
		List<String> checkOutList = Arrays.asList(checkOutDate.split("\\."));
		
		Calendar today = Calendar.getInstance();
		String today_string = String.format("%d.%02d.%02d", today.get(Calendar.YEAR), today.get(Calendar.MONTH) + 1, today.get(Calendar.DATE));
		
		
		///////////////////// room info /////////////////////
		String rent_room_sql = "";
		List<String> lodge_room_sqls = new ArrayList<>();
		String weekday_gift_sql = "";
		String weekend_gift_sql = "";
		
		if(checkInDate.equals(checkOutDate)) {
			String rent_room_table = String.format("rent_%s_%02d", checkInList.get(0), Integer.parseInt(checkInList.get(1)));
			
			List<String> rent_room_columnList = Arrays.asList(
					"rent_price as room_price", "rent_begin", "rent_period");
			
			HashMap<String, List<String>> rent_room_condition_hashmap = new HashMap<>() {{
				put("day", Arrays.asList("value", checkInList.get(2)));
				put("room_id", Arrays.asList("value", room));
			}};
			
			rent_room_sql = select_query(rent_room_table, rent_room_columnList, rent_room_condition_hashmap, null, null);
		} else {
//			HashMap<String, Integer> dateMap = calculateDate(checkInDate, checkOutDate);
			JSONObject dateMap = calculateDate(checkInDate, checkOutDate);
			JSONObject holiday = (JSONObject) dateMap.get("holiday");
			int lodgePeriod = (int) dateMap.get("lodgePeriod");
			int lodgeMonth = (int) dateMap.get("lodgeMonth");
			int weekday = (int) dateMap.get("weekday");
			int weekend = (int) dateMap.get("weekend");
			
			if(lodgeMonth == 1) {
				String lodge_room_table = String.format("lodge_%s_%02d", checkInList.get(0), Integer.parseInt(checkInList.get(1)));
				
//				List<String> lodge_room_columnList = Arrays.asList(
//						"sum(lodge_price) as room_price", "lodge_begin");
//				
//				HashMap<String, List<String>> rent_room_condition_hashmap = new HashMap<>() {{
//					put("day", Arrays.asList("value", checkInList.get(2)));
//					put("room_id", Arrays.asList("value", room));
//				}};
				
				int checkout_day = Integer.parseInt(checkOutList.get(2)) - 1;
				
				if(checkout_day == 0) {
					checkout_day = 31;
				}
				
				JSONArray holidayArray = (JSONArray) holiday.get(Integer.parseInt(checkInList.get(1))); 
				
				String holidayString = "0";
				if (holidayArray != null) {
					holidayString = String.join(", ", holidayArray);
				}
				
				lodge_room_sqls.add(String.format("select sum(lodge_price) as room_price, lodge_begin, (select lodge_end from rooms where room_id = %s) as lodge_end, "
						+ "if('%s' = '0', 0, max(if(day in (%s), lodge_price, 0))) as weekend_max_price, "
						+ "if('%s' = '0', max(lodge_price), max(if(day not in (%s), lodge_price, 0))) as weekday_max_price "
						+ "from %s where day between %s and %d and room_id = %s",
						room, holidayString, holidayString, holidayString, holidayString, lodge_room_table, checkInList.get(2), checkout_day, room));
			} else {
//				String lodge_room_table = String.format("lodge_%s_%02d", checkInList.get(0), Integer.parseInt(checkInList.get(1)));
//				
//				lodge_room_sqls.add(String.format("select sum(lodge_price) as room_price, lodge_begin from %s where day between %s and %d and room_id = %s",
//						lodge_room_table, checkInList.get(2), 31, room));
//				
//				for(int i=1; i < lodgeMonth; i++) {
//					lodge_room_table = String.format("lodge_%s_%02d", checkInList.get(0), Integer.parseInt(checkInList.get(1)) + i);
//					
//					lodge_room_sqls.add(String.format("select sum(lodge_price) as room_price from %s where day between %s and %d and room_id = %s",
//							lodge_room_table, checkInList.get(2), 31, room));
//				}
			}
			
			weekday_gift_sql = String.format("select if(count(*) < %d, count(*), %d) as weekday_gift_count, (select weekday_price from gifts where room_id = %s) as weekday_gift_price "
					+ "from user_gifts where user_id = %s and room_id = %s and gift_type = 0 and use_date is null and purchase_state = 1 and cancel_date is null and valid_date >= %s",
					weekday, weekday, room, makeString(user), room, makeString(today_string));
			
			weekend_gift_sql = String.format("select if(count(*) < %d, count(*), %d) as weekend_gift_count, (select weekend_price from gifts where room_id = %s) as weekend_gift_price "
					+ "from user_gifts where user_id = %s and room_id = %s and gift_type = 1 and use_date is null and purchase_state = 1 and cancel_date is null and valid_date >= %s",
					weekend, weekend, room, makeString(user), room, makeString(today_string));
		}
		/////////////////// room name, img //////////////////////
		String room_common_sql = String.format("select room_name, %s from rooms where room_id = %s", imgURL("room_thumb_url"), room);
		
		
		/////////////////// room option info ////////////////////////
		List<String> option_columnList = Arrays.asList(
				"option_id", "option_name", "option_price");
		
		HashMap<String, List<String>> option_condition_hashmap = new HashMap<>() {{
			put("room_id", Arrays.asList("value", room));
			put("option_status", Arrays.asList("value", "1"));
		}};
		
		String option_sql = select_query("room_options", option_columnList, option_condition_hashmap, null, null);
		
		
		//////////////////// amenity info /////////////////////////
		List<String> amenity_option_columnList = Arrays.asList(
				json_arrayagg_query(json_object_query(Arrays.asList(
						"amenity_option_id", "amenity_option_name",	"amenity_option_price"),
						Arrays.asList("'is_selected'","if(is_default, 'true', 'false')"))));
		
		HashMap<String, List<String>> amenity_option_condition_hashmap = new HashMap<>() {{
			put("amenity_id", Arrays.asList("value", "room_amenities.amenity_id"));
			put("room_amenity_options.amenity_status", Arrays.asList("value", "1"));
		}};
		
		String amenity_option_sql = select_query("room_amenity_options", amenity_option_columnList, amenity_option_condition_hashmap, null, null);
		
		List<String> amenity_columnList = Arrays.asList(
				"amenity_id", "amenity_name", String.format("(%s) as amenity_options", amenity_option_sql));
		
		HashMap<String, List<String>> amenity_condition_hashmap = new HashMap<>() {{
			put("room_id", Arrays.asList("value", room));
			put("room_amenities.amenity_status", Arrays.asList("value", "1"));
		}};
		
		String amenity_sql = select_query("room_amenities", amenity_columnList, amenity_condition_hashmap, null, null);
		
		if (conn == null) {
			conn();
		}
		
		try {
			
			///////////////////// room info /////////////////////
			if (checkInDate.equals(checkOutDate)) {
				psmt = conn.prepareStatement(rent_room_sql);			
				rs = psmt.executeQuery();
				
				rs.next();
				
				info.put("room_price", rs.getInt("room_price"));
				info.put("rent_begin", calculateRentBegin(checkInDate, rs.getString("rent_begin")));
				info.put("rent_period", rs.getInt("rent_period"));
				
			} else {
				int room_price = 0;
				int weekday_gift_price = 0;
				int weekend_gift_price = 0;
				
				for(String sql : lodge_room_sqls) {
					psmt = conn.prepareStatement(sql);			
					rs = psmt.executeQuery();
					
					rs.next();
					
					room_price += rs.getInt("room_price");
					weekend_gift_price = Math.max(weekend_gift_price, rs.getInt("weekend_max_price"));
					weekday_gift_price = Math.max(weekday_gift_price, rs.getInt("weekday_max_price"));
					
					System.out.println(room_price);
					
					if(rs.getString("lodge_begin") != null) {
						info.put("lodge_begin", rs.getString("lodge_begin").length() == 4 ? "0" + rs.getString("lodge_begin") : rs.getString("lodge_begin"));
						info.put("lodge_end", rs.getString("lodge_end").length() == 4 ? "0" + rs.getString("lodge_end") : rs.getString("lodge_end"));
					}
				}
				
				info.put("room_price", room_price);
				
				
				psmt = conn.prepareStatement(weekday_gift_sql);			
				rs = psmt.executeQuery();
				
				rs.next();
				
				info.put("weekday_gift_count", rs.getInt("weekday_gift_count"));
				info.put("weekday_gift_price", Math.min(rs.getInt("weekday_gift_price"), weekday_gift_price));
				
				
				psmt = conn.prepareStatement(weekend_gift_sql);			
				rs = psmt.executeQuery();
				
				rs.next();
				
				info.put("weekend_gift_count", rs.getInt("weekend_gift_count"));
				info.put("weekend_gift_price", Math.min(rs.getInt("weekend_gift_price"), weekend_gift_price));
			}
			
			/////////////////// room name, img ////////////////////////
			psmt = conn.prepareStatement(room_common_sql);
			rs = psmt.executeQuery();
			
			rs.next();
			
			info.put("room_name", rs.getString("room_name"));
			info.put("room_img_url", rs.getString("room_thumb_url"));
			
			/////////////////// room option info ////////////////////////
			JSONArray optionList = new JSONArray();
			
			psmt = conn.prepareStatement(option_sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JSONObject jsonObject = new JSONObject();
				
				jsonObject.put("option_id", rs.getInt("option_id"));
				jsonObject.put("option_name", rs.getString("option_name"));
				jsonObject.put("option_price", rs.getInt("option_price"));
				jsonObject.put("option_count", 0);
				
				optionList.add(jsonObject);
			}
			
			info.put("room_options", optionList);
			
			
			//////////////////// amenity info ///////////////////////
			JSONArray amenityList = new JSONArray();
			
			psmt = conn.prepareStatement(amenity_sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JSONObject jsonObject = new JSONObject();
				
				jsonObject.put("amenity_id", rs.getInt("amenity_id"));
				jsonObject.put("amenity_name", rs.getString("amenity_name"));
				jsonObject.put("amenity_options", (JSONArray) JSONValue.parse(rs.getString("amenity_options") == null ? "[]" : rs.getString("amenity_options")));
				
				amenityList.add(jsonObject);
			}
			
			info.put("amenities", amenityList);
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
		
		return info;
		
	}
	
	private JSONObject calculateDate(String checkInDate, String checkOutDate) {
		
		JSONObject returnMap = new JSONObject();
		
		List<Integer> checkInList = Arrays.asList(checkInDate.split("\\.")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		List<Integer> checkOutList = Arrays.asList(checkOutDate.split("\\.")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		Calendar checkIn = Calendar.getInstance();
		Calendar checkOut = Calendar.getInstance();
		
		checkIn.set(checkInList.get(0), checkInList.get(1) - 1, checkInList.get(2));
		checkOut.set(checkOutList.get(0), checkOutList.get(1) - 1, checkOutList.get(2));
		
		// 연산에 사용할 Calendar
		Calendar tempDate = Calendar.getInstance();
		
		String holiday_sql = "SELECT json_object(month, json_arrayagg(day)) as holiday FROM buyinhotel.holiday "
				+ "where str_to_date(concat(ifnull(year, 2022), '.', month, '.', day), '%Y.%m.%d') between ? and ? group by month";
		
		JSONObject holidayObject = new JSONObject();
		
		tempDate.set(checkInList.get(0), checkInList.get(1) - 1, checkInList.get(2));
		
		for (Calendar date = tempDate; date.compareTo(checkOut) < 0; date.add(Calendar.DATE, 1)) { 		 
			 if (date.get(Calendar.DAY_OF_WEEK) == 6 || date.get(Calendar.DAY_OF_WEEK) == 7) {
				 int month = date.get(Calendar.MONTH) + 1;
				 
				 if (!holidayObject.containsKey(month)) {
					 holidayObject.put(month, new JSONArray());
				 }
				 
				 ((JSONArray) holidayObject.get(month)).add(String.valueOf(date.get(Calendar.DATE)));
			 }
		}
		
		conn();
		
		try {
			tempDate.set(checkInList.get(0), checkInList.get(1) - 1, checkInList.get(2) + 1);
			
			psmt = conn.prepareStatement(holiday_sql);
			psmt.setString(1, String.format("%d-%02d-%02d", tempDate.get(Calendar.YEAR), tempDate.get(Calendar.MONTH) + 1, tempDate.get(Calendar.DATE)));
			psmt.setString(2, String.format("%d-%02d-%02d", checkOut.get(Calendar.YEAR), checkOut.get(Calendar.MONTH) + 1, checkOut.get(Calendar.DATE)));
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JSONObject monthObject = (JSONObject) JSONValue.parse(rs.getString("holiday"));
				
				int month = Integer.parseInt((String) monthObject.keySet().toArray()[0]);
				JSONArray days = (JSONArray) monthObject.get(String.valueOf(month));
				
				for (Object day : days) {
					if (day.equals(1L)) {
						tempDate.set(2022, month - 1, 0);
						
						if (!holidayObject.containsKey(month - 1)) {							
							holidayObject.put(month - 1, new JSONArray());
						}
						
						if (!((JSONArray) holidayObject.get(month - 1)).contains(String.valueOf(tempDate.get(Calendar.DATE)))) {
							((JSONArray) holidayObject.get(month - 1)).add(String.valueOf(tempDate.get(Calendar.DATE)));
						}
					} else {
						if (!holidayObject.containsKey(month)) {							
							holidayObject.put(month, new JSONArray());
						}
						
						if (!((JSONArray) holidayObject.get(month)).contains(String.valueOf((Long) day - 1))) {
							((JSONArray) holidayObject.get(month)).add(String.valueOf((Long) day - 1));
						}
					}
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			close();
			
			return null;
		}
		
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
        
        if(checkOutList.get(2) == 1) {
        	lodgeMonth -= 1;
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
        
        returnMap.put("holiday", holidayObject);
        returnMap.put("lodgePeriod", lodgePeriod);
        returnMap.put("lodgeMonth", lodgeMonth);
        returnMap.put("weekday", weekday);
        returnMap.put("weekend", weekend);
        
        return returnMap;
	}
	
//	private HashMap<String, Integer> calculateDate(String checkInDate, String checkOutDate) {
//		
//		HashMap<String, Integer> returnMap = new HashMap<String, Integer>();
//		
//		List<Integer> checkInList = Arrays.asList(checkInDate.split("\\.")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
//		List<Integer> checkOutList = Arrays.asList(checkOutDate.split("\\.")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
//		
//		Calendar checkIn = Calendar.getInstance();
//		Calendar checkOut = Calendar.getInstance();
//		
//		checkIn.set(checkInList.get(0), checkInList.get(1) - 1, checkInList.get(2));
//		checkOut.set(checkOutList.get(0), checkOutList.get(1) - 1, checkOutList.get(2));
//		
//		//////////// lodgePeroid ///////////////
//		
//        int checkInYearDay = checkIn.get(Calendar.DAY_OF_YEAR);
//        int checkOutYearDay = checkOut.get(Calendar.DAY_OF_YEAR);
//        
//        int lodgePeriod;
//        
//        if(checkInYearDay <= checkOutYearDay) {
//        	lodgePeriod = checkOutYearDay - checkInYearDay; 
//        }
//        else {
//        	Calendar lastDay = Calendar.getInstance();
//        	lastDay.set(checkInList.get(0), 11, 31);
//        	lodgePeriod = checkOutYearDay - checkInYearDay + lastDay.get(Calendar.DAY_OF_YEAR);
//        }
//        
//        //////////// lodgeMonth ////////////////
//        
//        int lodgeMonth;
//        
//        if(checkInList.get(1) <= checkOutList.get(1)) {
//        	lodgeMonth = checkOutList.get(1) - checkInList.get(1) + 1;
//        } else {
//        	lodgeMonth = checkOutList.get(1) - checkInList.get(1) + 13;
//        }
//        
//        if(checkOutList.get(2) == 1) {
//        	lodgeMonth -= 1;
//        }
//        
//        //////////// weekday, weekend count /////////////
//        
//        int checkinWeekDay = checkIn.get(Calendar.DAY_OF_WEEK) - 1;
//        int week = lodgePeriod / 7;
//
//        int weekday = 0;
//        int weekend = 0;
//
//        for (int i = checkinWeekDay; i < checkinWeekDay + lodgePeriod % 7; i++) {
//            if (i % 7 < 5) weekday += 1;
//            else weekend += 1;
//        }
//
//        weekday += (5 * week);
//        weekend += (2 * week);
//        
//        returnMap.put("lodgePeriod", lodgePeriod);
//        returnMap.put("lodgeMonth", lodgeMonth);
//        returnMap.put("weekday", weekday);
//        returnMap.put("weekend", weekend);
//        
//        return returnMap;
//	}
	
	public String calculateRentBegin(String checkinDate, String rentBegin) {
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("YYYY/MM/dd");
		List<Integer> date = Arrays.asList(LocalDate.now().format(dateFormatter).split("/")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
		List<Integer> time = Arrays.asList(LocalTime.now().format(timeFormatter).split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		String now = String.format("%04d.%02d.%02d %02d:%02d", date.get(0), date.get(1), date.get(2), time.get(0), time.get(1));
		
		
		List<Integer> use_date = Arrays.asList(checkinDate.split("\\.")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		List<Integer> use_time = Arrays.asList(rentBegin.split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		String checkin = String.format("%04d.%02d.%02d %02d:%02d", use_date.get(0), use_date.get(1), use_date.get(2), use_time.get(0), use_time.get(1));
		
		if (checkin.compareTo(now) < 0) {
			if (time.get(1) < 30) {
				return String.format("%02d:%02d", time.get(0), 30);
			} else {
				return String.format("%02d:%02d", time.get(0) + 1, 0);
			}
		} else {
			return rentBegin;
		}
	}
}
