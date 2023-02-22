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
import java.util.stream.Collectors;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class ReservationDAO extends TotalDAO {
	
	public int getJustReserveID(String user) {
		
		conn();
		
		String sql = "select shopbasket_id from shopbaskets where user_id = ? and just_reserve = 1";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			rs = psmt.executeQuery();
			
			rs.next();
			
			return rs.getInt("shopbasket_id");
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			return -1;
		}
	}
	
	public JSONObject getOriginPrice(Object shopbaskets) {
		if(shopbaskets instanceof Integer) {
			JSONObject priceObject = new JSONObject();
			JSONObject giftPriceObject = new JSONObject();
			
			String sql = "select reserve_price, room_id, weekday_gift_price, weekend_gift_price from shopbaskets where shopbasket_id = ?";
			
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, (Integer) shopbaskets);
				rs = psmt.executeQuery();
				
				rs.next();
				
				priceObject.put("reserve_price", rs.getInt("reserve_price"));
				
				giftPriceObject.put(rs.getInt("room_id"), new JSONObject() {{
					put("weekday", rs.getInt("weekday_gift_price"));
					put("weekend", rs.getInt("weekend_gift_price"));
				}});
				
				priceObject.put("gift_price", giftPriceObject);
				
				return priceObject;
				
			} catch (SQLException e) {
				e.printStackTrace();
				close();
				return null;
			}
		} else if(shopbaskets instanceof String) {
			JSONObject priceObject = new JSONObject();
			JSONObject giftPriceObject = new JSONObject();
			
			String sql = String.format("select sum(reserve_price) as reserve_price, room_id, weekday_gift_price, weekend_gift_price "
					+ "from shopbaskets where shopbasket_id in %s group by room_id", 
					shopbaskets);
			
			conn();
			
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				
				int reserve_price = 0;
				
				while(rs.next()) {
					reserve_price += rs.getInt("reserve_price");
					
					giftPriceObject.put(rs.getInt("room_id"), new JSONObject() {{
						put("weekday", rs.getInt("weekday_gift_price"));
						put("weekend", rs.getInt("weekend_gift_price"));
					}});
				}
				
				priceObject.put("reserve_price", reserve_price);
				priceObject.put("gift_price", giftPriceObject);
				
				return priceObject;
				
			} catch (SQLException e) {
				e.printStackTrace();
				close();
				return null;
			}
		}
		
		return null;
	}
	
	public JSONObject searchReservationBasicInfo(String user, String shopbaskets) {
		JSONObject info = new JSONObject();
		
		Calendar today = Calendar.getInstance();
		String today_string = String.format("%d.%02d.%02d", today.get(Calendar.YEAR), today.get(Calendar.MONTH) + 1, today.get(Calendar.DATE));
		
		int shopbasket = -1;
		int shopbasket_num = 1;
		
		JSONObject giftPrice;
		
		if(shopbaskets == null) {
			shopbasket = getJustReserveID(user);	
			if(shopbasket == -1) {
				return null;
			} 
			
			info.put("shopbasket_id", shopbasket);
			
			JSONObject originPrice = getOriginPrice(shopbasket);
			
			if(originPrice == null) {
				return null;
			}
			
			info.put("origin_price", originPrice.get("reserve_price"));
			
			giftPrice = (JSONObject) originPrice.get("gift_price");
		} else {			
			JSONObject originPrice = getOriginPrice(shopbaskets);
			
			if(originPrice == null) {
				return null;
			}
			
			info.put("origin_price", originPrice.get("reserve_price"));
			
			giftPrice = (JSONObject) originPrice.get("gift_price");
			
			String[] shopbasket_list = shopbaskets.substring(1, shopbaskets.length() - 1).split(",");
			shopbasket = Integer.parseInt(shopbasket_list[0]);
			shopbasket_num = shopbasket_list.length;
		}
		
		
		////////////// hotel info ///////////////
		String hotel_info_sql = "select (select lodgement_name from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = (select room_id from shopbaskets where shopbasket_id = ?))) as lodgement_name, "
				+ "(select room_name from rooms where room_id = (select room_id from shopbaskets where shopbasket_id = ?)) as room_name";
		
		
		////////////// user info ///////////////
		List<String> user_columnList = Arrays.asList(
				"user_name", "user_phone_numb as user_tel", "user_email", "user_point");
		
		HashMap<String, List<String>> user_condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
		}};
		
		String user_sql = select_query("adiot.UserData", user_columnList, user_condition_hashmap, null, null);
		
		
		////////////// coupon info ///////////////
		List<String> coupon_columnList = Arrays.asList(
				"user_coupon_id as coupon_id", "coupon_name", "is_percent", "coupon_charge", "min_price", "max_charge");
		
		HashMap<String, List<String>> coupon_condition_hashmap = new HashMap<>() {{
			put("adiot.user_coupons.coupon_id", Arrays.asList("value", "adiot.coupons.coupon_id"));
			put("user_id", Arrays.asList("value", makeString(user)));
			put("use_date", Arrays.asList("null", ""));
			put("adiot.user_coupons.valid_date", Arrays.asList("not_less", makeString(today_string)));
		}};
		
		String coupon_sql = select_query("adiot.user_coupons", coupon_columnList, null,
				join_query("adiot.coupons", coupon_condition_hashmap), null);
		
		
		////////////// buyroom info ///////////////
		List<String> buyroom_columnList = Arrays.asList(
				"user_gift_id as gift_id", "user_gifts.room_id", "gift_type", "gift_name", "payment_charge", imgURL("room_thumb_url"), "valid_date",
				"(select user_name from adiot.UserData where user_id = sender_id) as sender_name");
		
		String room_id_subquery;
		
		if (shopbaskets != null) {
			room_id_subquery = String.format("select room_id from shopbaskets where shopbasket_id in %s", shopbaskets);
		} else {
			room_id_subquery = String.format("select room_id from shopbaskets where shopbasket_id = %d", shopbasket);
		}
		
		HashMap<String, List<String>> buyroom_condition_hashmap = new HashMap<>() {{
//			put("user_gifts.room_id", Arrays.asList("value", "rooms.room_id"));
			put("user_gifts.room_id", Arrays.asList("in", room_id_subquery));
			put("user_id", Arrays.asList("value", makeString(user)));
			put("use_date", Arrays.asList("null", ""));
			put("user_gifts.valid_date", Arrays.asList("not_less", makeString(today_string)));
			put("purchase_state", Arrays.asList("value", "1"));
			put("cancel_date", Arrays.asList("null", ""));
		}};
		
		String buyroom_sql = select_query("user_gifts", buyroom_columnList, null, 
				join_query("rooms", buyroom_condition_hashmap), null) + " and user_gifts.room_id = rooms.room_id";
		
		System.out.println(buyroom_sql);
		
		
		////////////// giftcard info ///////////////
		List<String> giftcard_columnList = Arrays.asList(
				"user_giftcard_id as giftcard_id", "giftcard_name", "giftcard_price", imgURL("giftcard_img_url"), "valid_date",
				"(select user_name from adiot.UserData where user_id = sender_id) as sender_name");
		
		HashMap<String, List<String>> giftcard_condition_hashmap = new HashMap<>() {{
			put("user_giftcards.giftcard_id", Arrays.asList("value", "giftcards.giftcard_id"));
			put("user_id", Arrays.asList("value", makeString(user)));
			put("use_date", Arrays.asList("null", ""));
			put("user_giftcards.valid_date", Arrays.asList("not_less", makeString(today_string)));
			put("purchase_state", Arrays.asList("value", "1"));
			put("cancel_date", Arrays.asList("null", ""));
		}};
		
		String giftcard_sql = select_query("user_giftcards", giftcard_columnList, null, 
				join_query("giftcards", giftcard_condition_hashmap), null);
		
		try {
			////////////// hotel info //////////////
			psmt = conn.prepareStatement(hotel_info_sql);
			psmt.setInt(1, shopbasket);
			psmt.setInt(2, shopbasket);
			rs = psmt.executeQuery();
			
			rs.next();
			
			info.put("lodgement_name", rs.getString("lodgement_name"));
			
			if (shopbasket_num > 1) {
				info.put("room_name", rs.getString("room_name") + "외 " + (shopbasket_num - 1));
			} else {
				info.put("room_name", rs.getString("room_name"));
			}
			
			////////////// user info ///////////////
			psmt = conn.prepareStatement(user_sql);
			rs = psmt.executeQuery();
			
			rs.next();
			
			info.put("user_name", rs.getString("user_name"));
			info.put("user_tel", rs.getString("user_tel"));
			info.put("user_email", rs.getString("user_email"));
			info.put("user_point", rs.getInt("user_point"));
			
			
			////////////// coupon info ///////////////
			psmt = conn.prepareStatement(coupon_sql);
			rs = psmt.executeQuery();
			
			JSONArray couponList = new JSONArray();
			
			while(rs.next()) {
				JSONObject couponObject = new JSONObject();
				
				couponObject.put("coupon_id", rs.getInt("coupon_id"));
				couponObject.put("coupon_name", rs.getString("coupon_name"));
				couponObject.put("is_percent", rs.getBoolean("is_percent"));
				couponObject.put("coupon_charge", rs.getFloat("coupon_charge"));
				couponObject.put("min_price", rs.getInt("min_price"));
				couponObject.put("max_charge", rs.getInt("max_charge"));
				
				couponList.add(couponObject);
			}
			
			info.put("coupons", couponList);
			
			
			////////////// buyroom info ///////////////
			psmt = conn.prepareStatement(buyroom_sql);
			rs = psmt.executeQuery();
			
			JSONArray buyroomList = new JSONArray();
			
			while(rs.next()) {
				boolean gift_type = rs.getBoolean("gift_type");
				
				int gift_price;
				
				if (gift_type) {
					gift_price = (int) ((JSONObject) giftPrice.get(rs.getInt("room_id"))).get("weekend");
				} else {
					gift_price = (int) ((JSONObject) giftPrice.get(rs.getInt("room_id"))).get("weekday");
				}
				
				if (gift_price == 0) {
					continue;
				}
				
				JSONObject giftObject = new JSONObject();
				
				giftObject.put("gift_id", rs.getInt("gift_id"));
				giftObject.put("gift_type", "바이룸");
				giftObject.put("gift_name", rs.getString("gift_name"));
				giftObject.put("gift_price", Math.min(rs.getInt("payment_charge"), gift_price));
				giftObject.put("gift_img_url", rs.getString("room_thumb_url"));
				giftObject.put("gift_valid_date", rs.getString("valid_date"));
				giftObject.put("gift_sender", rs.getString("sender_name"));
				
				buyroomList.add(giftObject);
			}
			
			info.put("buyrooms", buyroomList);
			
			
			////////////// giftcard info ///////////////
			psmt = conn.prepareStatement(giftcard_sql);
			rs = psmt.executeQuery();
			
			JSONArray giftcardList = new JSONArray();
			
			while(rs.next()) {
				JSONObject giftcardObject = new JSONObject();
				
				giftcardObject.put("giftcard_id", rs.getInt("giftcard_id"));
				giftcardObject.put("giftcard_name", rs.getString("giftcard_name"));
				giftcardObject.put("giftcard_price", rs.getInt("giftcard_price"));
				giftcardObject.put("giftcard_img_url", rs.getString("giftcard_img_url"));
				giftcardObject.put("valid_date", rs.getString("valid_date"));
				giftcardObject.put("sender_name", rs.getString("sender_name"));
				
				giftcardObject.put("gift_id", rs.getInt("giftcard_id"));
				giftcardObject.put("gift_type", "기프트카드");
				giftcardObject.put("gift_name", rs.getString("giftcard_name"));
				giftcardObject.put("gift_price", rs.getInt("giftcard_price"));
				giftcardObject.put("gift_img_url", rs.getString("giftcard_img_url"));
				giftcardObject.put("gift_valid_date", rs.getString("valid_date"));
				giftcardObject.put("gift_sender", rs.getString("sender_name"));
				
				giftcardList.add(giftcardObject);
			}
			
			info.put("giftcards", giftcardList);
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			close();
		}
		
		return info;
	}
	
	public String addReservation(String user, String shopBaskets, String bookerInfo, String lodgeUserInfo, String coupon, String couponCharge, String pointCharge, 
			String giftcard, String giftcardCharge, String paymentMethod, String paymentCharge) {
		
		HashMap<String, List<String>> delete_condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
			put("purchase_state", Arrays.asList("null", ""));
		}};
		
		String delete_sql = delete_query("reservations", delete_condition_hashmap);
		
//		String buyroom_sql = "select room_id, gift_type from user_gifts where gift_id = ?";
		
		List<String> columnList = Arrays.asList("room_id", "user_id", "reservation_date", "lodge_type", "room_price", "checkin_date", "checkout_date",
				"weekday_gift_count", "weekday_gift_price", "weekend_gift_count", "weekend_gift_price", "option_list", "amenity_list", "total_price",
				"shopbasket_id", "booker_info", "lodgeuser_info", "coupon_id", "coupon_charge", "point_charge",
				"giftcard_id", "giftcard_charge", "payment_method", "payment_charge", "purchase_id");
		
		List<String> sub_columnList = Arrays.asList("room_id", "user_id", "now()", "lodge_type", "room_price", "checkin_date", "checkout_date",
				"weekday_gift_count", "weekday_gift_price", "weekend_gift_count", "weekend_gift_price", "option_list", "amenity_list", "total_price",
				"shopbasket_id", json_object_insert((JSONObject) JSONValue.parse(bookerInfo)), json_object_insert((JSONObject) JSONValue.parse(lodgeUserInfo)), 
				coupon, "?", "?", giftcard, "?", makeString(paymentMethod), "?", "?");
		
		HashMap<String, List<String>> sub_condition_hashmap = new HashMap<>() {{
			put("shopbasket_id", Arrays.asList("value", "?"));
		}};
		
		String subquery = select_query("shopbaskets", sub_columnList, sub_condition_hashmap, null, null);
		
		String sql = insert_query("reservations", columnList, null, subquery, false);
		
		String select_sql = "select room_id, reserve_price, weekday_gift_price from shopbaskets where shopbasket_id = ?";
		
		int coupon_charge = Integer.parseInt(couponCharge);
		int point_charge = Integer.parseInt(pointCharge);
		Integer gift_room_id = null;
		Boolean gift_type = null;
		int gift_charge = 0;
		int giftcard_charge = Integer.parseInt(giftcardCharge);
		int payment_charge = Integer.parseInt(paymentCharge);
		String OID = null;
		
		if (shopBaskets == null) {
			shopBaskets = String.format("[%d]", getJustReserveID(user));
		} else {
			conn();
		}
		
		try {
			conn.setAutoCommit(false);
			
			psmt = conn.prepareStatement(delete_sql);
			psmt.executeUpdate();
			
//			if(gift != null) {
//				psmt = conn.prepareStatement(buyroom_sql);
//				psmt.setString(1, gift);
//				rs = psmt.executeQuery();
//				
//				rs.next();
//				
//				gift_room_id = rs.getInt("room_id");
//				gift_type = rs.getBoolean("gift_type");
//			}
			
			for (Object shopbasket_id : (JSONArray) JSONValue.parse(shopBaskets)) {
				OID = OID == null ? getOID(shopbasket_id.toString()) : OID;
				
				if(OID.equals("")) {
					return null;
				}
				
				psmt = conn.prepareStatement(select_sql);
				psmt.setString(1, shopbasket_id.toString());
				rs = psmt.executeQuery();
				
				rs.next();
				
				int reserve_price = rs.getInt("reserve_price");
				
				psmt = conn.prepareStatement(sql);
				
				if(coupon_charge != 0 && reserve_price != 0) {
					if(coupon_charge >= reserve_price) {
						psmt.setInt(1, reserve_price);
						coupon_charge = coupon_charge - reserve_price;
						reserve_price = 0;
					} else {
						psmt.setInt(1, coupon_charge);
						reserve_price = reserve_price - coupon_charge;
						coupon_charge = 0;
					}
				} else {
					psmt.setInt(1, 0);
				}
				
				if(point_charge != 0 && reserve_price != 0) {
					if(point_charge >= reserve_price) {
						psmt.setInt(2, reserve_price);
						point_charge = point_charge - reserve_price;
						reserve_price = 0;
					} else {
						psmt.setInt(2, point_charge);
						reserve_price = reserve_price - point_charge;
						point_charge = 0;
					}
				} else {
					psmt.setInt(2, 0);
				}
				
				if(giftcard_charge != 0 && reserve_price != 0) {
					if(giftcard_charge >= reserve_price) {
						psmt.setInt(3, reserve_price);
						giftcard_charge = giftcard_charge - reserve_price;
						reserve_price = 0;
					} else {
						psmt.setInt(3, giftcard_charge);
						reserve_price = reserve_price - giftcard_charge;
						giftcard_charge = 0;
					}
				} else {
					psmt.setInt(3, 0);
				}
				
				psmt.setInt(4, reserve_price);
				psmt.setString(5, OID);
				psmt.setString(6, shopbasket_id.toString());
				psmt.executeUpdate();
			}
			
			String payment_confirm_sql = "select sum(payment_charge) as total_payment from reservations where purchase_id = ?";
			
			psmt = conn.prepareStatement(payment_confirm_sql);
			psmt.setString(1, OID);
			rs = psmt.executeQuery();
			
			rs.next();
			
			if(payment_charge != rs.getInt("total_payment")) {
				conn.rollback();
				
				return null;
			}
			
			conn.commit();
				
			return OID;
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			return null;
		} finally {
			close();
		}
	}
	
	public String addReservationVer2(String user, String shopBaskets, String bookerInfo, String lodgeUserInfo, String coupon, String couponCharge, String pointCharge, 
			String gift, String giftCharge, String giftcard, String giftcardCharge, String paymentMethod, String paymentCharge) {
		
		HashMap<String, List<String>> delete_condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
			put("purchase_state", Arrays.asList("null", ""));
		}};
		
		String delete_sql = delete_query("reservations", delete_condition_hashmap);
		
		String buyroom_sql = "select room_id from user_gifts where user_gift_id = ?";
		
		List<String> columnList = Arrays.asList("room_id", "user_id", "reservation_date", "lodge_type", "room_price", "checkin_date", "checkout_date",
				"weekday_gift_count", "weekday_gift_price", "weekend_gift_count", "weekend_gift_price", "option_list", "amenity_list", "total_price",
				"shopbasket_id", "booker_info", "lodgeuser_info", "coupon_id", "coupon_charge", "point_charge", "gift_id", "gift_charge",
				"giftcard_id", "giftcard_charge", "payment_method", "payment_charge", "purchase_id");
		
		List<String> sub_columnList = Arrays.asList("room_id", "user_id", "now()", "lodge_type", "room_price", "checkin_date", "checkout_date",
				"weekday_gift_count", "weekday_gift_price", "weekend_gift_count", "weekend_gift_price", "option_list", "amenity_list", "total_price",
				"shopbasket_id", json_object_insert((JSONObject) JSONValue.parse(bookerInfo)), json_object_insert((JSONObject) JSONValue.parse(lodgeUserInfo)), 
				coupon, "?", "?", gift, "?", giftcard, "?", makeString(paymentMethod), "?", "?");
		
		HashMap<String, List<String>> sub_condition_hashmap = new HashMap<>() {{
			put("shopbasket_id", Arrays.asList("value", "?"));
		}};
		
		String subquery = select_query("shopbaskets", sub_columnList, sub_condition_hashmap, null, null);
		
		String sql = insert_query("reservations", columnList, null, subquery, false);
		
		String select_sql = "select room_id, reserve_price from shopbaskets where shopbasket_id = ?";
		
		int coupon_charge = Integer.parseInt(couponCharge);
		int point_charge = Integer.parseInt(pointCharge);
		int gift_room_id = -1;
		int gift_charge = Integer.parseInt(giftCharge);
		int giftcard_charge = Integer.parseInt(giftcardCharge);
		int payment_charge = Integer.parseInt(paymentCharge);
		String OID = null;
		
		if (shopBaskets == null) {
			shopBaskets = String.format("[%d]", getJustReserveID(user));
		} else {
			conn();
		}
		
		try {
			conn.setAutoCommit(false);
			
			psmt = conn.prepareStatement(delete_sql);
			psmt.executeUpdate();
			
			if(gift != null) {
				psmt = conn.prepareStatement(buyroom_sql);
				psmt.setString(1, gift);
				rs = psmt.executeQuery();
				
				rs.next();
				
				gift_room_id = rs.getInt("room_id");
			}
			
			for (Object shopbasket_id : (JSONArray) JSONValue.parse(shopBaskets)) {
				OID = OID == null ? getOID(shopbasket_id.toString()) : OID;
				
				if(OID.equals("")) {
					return null;
				}
				
				psmt = conn.prepareStatement(select_sql);
				psmt.setString(1, shopbasket_id.toString());
				rs = psmt.executeQuery();
				
				rs.next();
				
				int reserve_price = rs.getInt("reserve_price");
				int room_id = rs.getInt("room_id");
				
				psmt = conn.prepareStatement(sql);
				
				if(gift_room_id == room_id) {
					if(gift_charge <= reserve_price) {
						psmt.setInt(3, gift_charge);
						reserve_price = reserve_price - gift_charge;
						gift_charge = 0;
					} else {
						psmt.setInt(3, 0);
					}
				} else {
					psmt.setInt(3, 0);
				}
				
				if(coupon_charge != 0 && reserve_price != 0) {
					if(coupon_charge >= reserve_price) {
						psmt.setInt(1, reserve_price);
						coupon_charge = coupon_charge - reserve_price;
						reserve_price = 0;
					} else {
						psmt.setInt(1, coupon_charge);
						reserve_price = reserve_price - coupon_charge;
						coupon_charge = 0;
					}
				} else {
					psmt.setInt(1, 0);
				}
				
				if(point_charge != 0 && reserve_price != 0) {
					if(point_charge >= reserve_price) {
						psmt.setInt(2, reserve_price);
						point_charge = point_charge - reserve_price;
						reserve_price = 0;
					} else {
						psmt.setInt(2, point_charge);
						reserve_price = reserve_price - point_charge;
						point_charge = 0;
					}
				} else {
					psmt.setInt(2, 0);
				}
				
				if(giftcard_charge != 0 && reserve_price != 0) {
					if(giftcard_charge >= reserve_price) {
						psmt.setInt(4, reserve_price);
						giftcard_charge = giftcard_charge - reserve_price;
						reserve_price = 0;
					} else {
						psmt.setInt(4, giftcard_charge);
						reserve_price = reserve_price - giftcard_charge;
						giftcard_charge = 0;
					}
				} else {
					psmt.setInt(4, 0);
				}
				
				psmt.setInt(5, reserve_price);
				psmt.setString(6, OID);
				psmt.setString(7, shopbasket_id.toString());
				psmt.executeUpdate();
			}
			
			String payment_confirm_sql = "select sum(payment_charge) as total_payment from reservations where purchase_id = ?";
			
			psmt = conn.prepareStatement(payment_confirm_sql);
			psmt.setString(1, OID);
			rs = psmt.executeQuery();
			
			rs.next();
			
			if(payment_charge != rs.getInt("total_payment")) {
				conn.rollback();
				
				return null;
			}
			
			conn.commit();
				
			return OID;
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			return null;
		} finally {
			close();
		}
	}
	
	private String getOID(String shopbasket_id) {
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yy/MM/dd");
		List<Integer> date = Arrays.asList(LocalDate.now().format(dateFormatter).split("/")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		List<Integer> time = Arrays.asList(LocalTime.now().format(timeFormatter).split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		String dateTimeString = String.format("%03d%02d%05d", date.get(0)*12 + date.get(1), date.get(2), time.get(0)*3600 + time.get(1)*60 + time.get(2));
		
		String sql = "select (select lodgement_id from rooms where room_id = shopbaskets.room_id) as lodgement_id, "
				+ "(select user_nick_name_code from adiot.UserData where user_id = shopbaskets.user_id) as user_nick from shopbaskets where shopbasket_id = ?";
		
		try {
				
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, shopbasket_id);
			rs = psmt.executeQuery();
			
			rs.next();
				
			return String.format("R%04d%s%s", rs.getInt("lodgement_id"), rs.getString("user_nick"), dateTimeString);
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			
			return "";
		}
	}
	
	public JSONArray searchReservations(String user) {
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("YYYY/MM/dd");
		List<Integer> date = Arrays.asList(LocalDate.now().format(dateFormatter).split("/")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
		List<Integer> time = Arrays.asList(LocalTime.now().format(timeFormatter).split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		String now = String.format("%04d.%02d.%02d %02d:%02d", date.get(0), date.get(1), date.get(2), time.get(0), time.get(1));
		
		System.out.println(now);
		
		JSONArray info = new JSONArray();
		
		List<String> columnList = Arrays.asList(
				"reservation_id", "reservation_date", 
				"(select lodgement_name from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_name",
				String.format("(select %s from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_img_url", imgURL("lodgement_img_url")),
				"(select room_name from rooms where room_id = reservations.room_id) as room_name", 
				"checkin_date", "checkout_date", "payment_charge");
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
			put("purchase_state", Arrays.asList("value", "1"));
			put("cancel_date", Arrays.asList("null", ""));
		}};
		
		String sql = select_query("reservations", columnList, condition_hashmap, null, null);
		
		System.out.println(sql);
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JSONObject object = new JSONObject();
				
				object.put("reservation_id", rs.getInt("reservation_id"));
				object.put("reservation_date", rs.getString("reservation_date"));
				object.put("lodgement_name", rs.getString("lodgement_name"));
				object.put("lodgement_img_url", rs.getString("lodgement_img_url"));
				object.put("room_name", rs.getString("room_name"));
				object.put("check_in", rs.getString("checkin_date"));
				object.put("check_out", rs.getString("checkout_date"));				
				object.put("charge", rs.getInt("payment_charge"));				
				
				List<Integer> use_date = Arrays.asList(rs.getString("checkin_date").split(" ")[0].split("\\.")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
				List<Integer> use_time = Arrays.asList(rs.getString("checkin_date").split(" ")[2].split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
				
				String checkin = String.format("%04d.%02d.%02d %02d:%02d", use_date.get(0), use_date.get(1), use_date.get(2), use_time.get(0), use_time.get(1));
				
				object.put("state", checkin.compareTo(now) > 0 ? "입실전" : "입실완료");
				
				info.add(object);
			}
				
			return info;
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			
			return null;
		}
	}
	
	public JSONArray searchReservationsVer2(String user) {
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("YYYY/MM/dd");
		List<Integer> date = Arrays.asList(LocalDate.now().format(dateFormatter).split("/")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
		List<Integer> time = Arrays.asList(LocalTime.now().format(timeFormatter).split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		String now = String.format("%04d.%02d.%02d %02d:%02d", date.get(0), date.get(1), date.get(2), time.get(0), time.get(1));
		
		System.out.println(now);
		
		JSONArray info = new JSONArray();
		
		List<String> columnList = Arrays.asList(
				"purchase_id", "reservation_date", 
				"(select lodgement_name from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_name",
				String.format("(select %s from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_img_url", imgURL("lodgement_img_url")),
				"(select room_name from rooms where room_id = reservations.room_id) as room_name", 
				"checkin_date", "checkout_date", "count(*) as room_count");
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
			put("purchase_state", Arrays.asList("value", "1"));
			put("cancel_date", Arrays.asList("null", ""));
		}};
		
		String sql = select_query("reservations", columnList, condition_hashmap, null, null) + " group by purchase_id";
		
		System.out.println(sql);
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JSONObject object = new JSONObject();
				
				object.put("reservation_id", rs.getString("purchase_id"));
				object.put("reservation_date", rs.getString("reservation_date"));
				object.put("lodgement_name", rs.getString("lodgement_name"));
				object.put("lodgement_img_url", rs.getString("lodgement_img_url"));
				object.put("room_name", rs.getString("room_name") + (rs.getInt("room_count") > 1 ? String.format("외 %d", rs.getInt("room_count") - 1) : ""));
				object.put("check_in", rs.getString("checkin_date"));
				object.put("check_out", rs.getString("checkout_date"));		
				
				List<Integer> use_date = Arrays.asList(rs.getString("checkin_date").split(" ")[0].split("\\.")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
				List<Integer> use_time = Arrays.asList(rs.getString("checkin_date").split(" ")[2].split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
				
				String checkin = String.format("%04d.%02d.%02d %02d:%02d", use_date.get(0), use_date.get(1), use_date.get(2), use_time.get(0), use_time.get(1));
				
				object.put("state", checkin.compareTo(now) > 0 ? "입실전" : "입실완료");
				
				info.add(object);
			}
				
			return info;
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			
			return null;
		}
	}
	
	public JSONObject searchReservationDetail(String reservationID) {
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("YYYY/MM/dd");
		List<Integer> date = Arrays.asList(LocalDate.now().format(dateFormatter).split("/")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
		List<Integer> time = Arrays.asList(LocalTime.now().format(timeFormatter).split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		String now = String.format("%04d.%02d.%02d %02d:%02d", date.get(0), date.get(1), date.get(2), time.get(0), time.get(1));
		
		System.out.println(now);
		
		List<String> columnList = Arrays.asList(
				"reservation_date", 
				"(select lodgement_name from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_name", 
				"purchase_id as OID",
				"(select lodgement_tel from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_tel",
				"checkin_date", "checkout_date",
				"(select room_name from rooms where room_id = reservations.room_id) as room_name", 
				"option_list", "booker_info", "total_price",
				"weekday_gift_count * weekday_gift_price + weekend_gift_count * weekend_gift_price as gift_charge",
				"coupon_charge", "point_charge", "giftcard_charge", "payment_charge");
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("reservation_id", Arrays.asList("value", reservationID));
		}};
		
		String sql = select_query("reservations", columnList, condition_hashmap, null, null);
		
		System.out.println(sql);
		
		String option_sql = "select option_name from room_options where option_id = ?";
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			rs.next();
		
			JSONObject object = new JSONObject();
				
			object.put("reservation_date", rs.getString("reservation_date"));
			object.put("lodgement_name", rs.getString("lodgement_name"));
			object.put("OID", rs.getString("OID"));
			object.put("lodgement_tel", rs.getString("lodgement_tel"));
			object.put("check_in", rs.getString("checkin_date"));
			object.put("check_out", rs.getString("checkout_date"));
			object.put("room_name", rs.getString("room_name"));
			object.put("user_info", (JSONObject) JSONValue.parse(rs.getString("booker_info")));
			object.put("total_price", rs.getInt("total_price"));
			object.put("gift_charge", rs.getInt("gift_charge"));
			object.put("coupon_charge", rs.getInt("coupon_charge"));
			object.put("point_charge", rs.getInt("point_charge"));
			object.put("giftcard_charge", rs.getInt("giftcard_charge"));
			object.put("payment_charge", rs.getInt("payment_charge"));				
			
			List<Integer> use_date = Arrays.asList(rs.getString("checkin_date").split(" ")[0].split("\\.")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
			List<Integer> use_time = Arrays.asList(rs.getString("checkin_date").split(" ")[2].split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
			
			String checkin = String.format("%04d.%02d.%02d %02d:%02d", use_date.get(0), use_date.get(1), use_date.get(2), use_time.get(0), use_time.get(1));
			
			object.put("state", checkin.compareTo(now) > 0 ? "입실전" : "입실완료");
			
			String optionString = "";
			JSONArray roomOptions = (JSONArray) JSONValue.parse(rs.getString("option_list"));
			
			for(Object option : roomOptions) {
				String optionID = (String) ((JSONObject) option).get("roomOptionID");
				String optionCount = (String) ((JSONObject) option).get("roomOptionCount");
				
				if (!optionCount.equals("0")) {
					psmt = conn.prepareStatement(option_sql);
					psmt.setString(1, optionID);
					rs = psmt.executeQuery();
					
					rs.next();
					
					optionString += String.format("%s : %s\n", rs.getString("option_name"), optionCount);
					
					System.out.println(optionString);
				}
			}
			
			if (optionString.equals("")) {
				optionString = "-";
			} else {
				optionString = optionString.strip();
			}
			
			object.put("room_option", optionString);
				
			return object;
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			
			return null;
		}
	}
	
	public JSONObject searchReservationDetailVer2(String reservationID) {
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("YYYY/MM/dd");
		List<Integer> date = Arrays.asList(LocalDate.now().format(dateFormatter).split("/")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
		List<Integer> time = Arrays.asList(LocalTime.now().format(timeFormatter).split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		String now = String.format("%04d.%02d.%02d %02d:%02d", date.get(0), date.get(1), date.get(2), time.get(0), time.get(1));
		
		System.out.println(now);
		
		List<String> columnList = Arrays.asList(
				"reservation_date", 
				"(select lodgement_name from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_name", 
				"purchase_id as OID",
				"json_arrayagg(json_object('checkin_date', checkin_date, 'checkout_date', checkout_date, "
				+ "'room_name', (select room_name from rooms where room_id = reservations.room_id), "
				+ "'room_img_url', (select room_thumb_url from rooms where room_id = reservations.room_id), "
				+ "'option_list', option_list, 'amenity_list', amenity_list, 'room_total_price', total_price)) as rooms",
				"booker_info", "sum(total_price) as total_price",
				"weekday_gift_count * weekday_gift_price + weekend_gift_count * weekend_gift_price as gift_charge",
				"sum(coupon_charge) as coupon_charge", "sum(point_charge) as point_charge", 
				"sum(giftcard_charge) as giftcard_charge", "sum(payment_charge) as payment_charge");
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("purchase_id", Arrays.asList("value", makeString(reservationID)));
		}};
		
		String sql = select_query("reservations", columnList, condition_hashmap, null, null);
		
		System.out.println(sql);
		
		String option_sql = "select option_name from room_options where option_id = ?";
		String amenity_sql = "select (select amenity_name from room_amenities where amenity_id = ?) as amenity_name, "
				+ "(select amenity_option_name from room_amenity_options where amenity_option_id = ?) as amenity_option_name";
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			rs.next();
		
			JSONObject object = new JSONObject();
				
			object.put("reservation_date", rs.getString("reservation_date"));
			object.put("lodgement_name", rs.getString("lodgement_name"));
			object.put("OID", rs.getString("OID"));
			object.put("rooms", (JSONArray) JSONValue.parse(rs.getString("rooms")));
			object.put("user_info", (JSONObject) JSONValue.parse(rs.getString("booker_info")));
			object.put("total_price", rs.getInt("total_price"));
			object.put("gift_charge", rs.getInt("gift_charge"));
			object.put("coupon_charge", rs.getInt("coupon_charge"));
			object.put("point_charge", rs.getInt("point_charge"));
			object.put("giftcard_charge", rs.getInt("giftcard_charge"));
			object.put("payment_charge", rs.getInt("payment_charge"));
			
			for(int i = 0; i < ((JSONArray) object.get("rooms")).size(); i++) {
				JSONObject room = (JSONObject) ((JSONArray) object.get("rooms")).get(i);
				
				if (i == 0) {
					List<Integer> use_date = Arrays.asList(((String) room.get("checkin_date")).split(" ")[0].split("\\.")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
					List<Integer> use_time = Arrays.asList(((String) room.get("checkin_date")).split(" ")[2].split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
					
					String checkin = String.format("%04d.%02d.%02d %02d:%02d", use_date.get(0), use_date.get(1), use_date.get(2), use_time.get(0), use_time.get(1));
					
					object.put("state", checkin.compareTo(now) > 0 ? "입실전" : "입실완료");
				}
				
				room.put("room_img_url", "https://www.buyinhotel.co.kr/images/" + room.get("room_img_url"));
				
				String optionString = "";
				JSONArray roomOptions = (JSONArray) room.get("option_list");
				
				for(Object option : roomOptions) {
					String optionID = (String) ((JSONObject) option).get("roomOptionID");
					String optionCount = (String) ((JSONObject) option).get("roomOptionCount");
					
					if (!optionCount.equals("0")) {
						psmt = conn.prepareStatement(option_sql);
						psmt.setString(1, optionID);
						rs = psmt.executeQuery();
						
						rs.next();
						
						optionString += String.format("%s : %s\n", rs.getString("option_name"), optionCount);
						
						System.out.println(optionString);
					}
				}
				
				if (optionString.equals("")) {
					optionString = "-";
				} else {
					optionString = optionString.strip();
				}
				
				room.put("room_option", optionString);
				room.remove("option_list");
				
				String amenityString = "";
				JSONArray roomAmenities = (JSONArray) room.get("amenity_list");
				
				for(Object amenity : roomAmenities) {
					String amenityID = (String) ((JSONObject) amenity).get("amenityID");
					String amenityOptionID = (String) ((JSONObject) amenity).get("amenityOptionID");
					
					psmt = conn.prepareStatement(amenity_sql);
					psmt.setString(1, amenityID);
					psmt.setString(2, amenityOptionID);
					rs = psmt.executeQuery();
					
					rs.next();
					
					amenityString += String.format("%s : %s\n", rs.getString("amenity_name"), rs.getString("amenity_option_name"));
					
					System.out.println(amenityString);
				}
				
				if (amenityString.equals("")) {
					amenityString = "-";
				} else {
					amenityString = amenityString.strip();
				}
				
				room.put("room_amenity", amenityString);
				room.remove("amenity_list");
			}
				
			return object;
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			
			return null;
		}
	}
	
	public JSONArray searchCancelations(String user) {		
		JSONArray info = new JSONArray();
		
		List<String> columnList = Arrays.asList(
				"reservation_id", "cancel_date", 
				"(select lodgement_name from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_name",
				String.format("(select %s from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_img_url", imgURL("lodgement_img_url")),
				"(select room_name from rooms where room_id = reservations.room_id) as room_name", 
				"checkin_date", "checkout_date", "refund_charge");
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
		}};
		
		String sql = select_query("reservations", columnList, condition_hashmap, null, null) + " and cancel_date is not null";
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JSONObject object = new JSONObject();
				
				object.put("cancel_id", rs.getInt("reservation_id"));
				object.put("cancel_date", rs.getString("cancel_date"));
				object.put("lodgement_name", rs.getString("lodgement_name"));
				object.put("lodgement_img_url", rs.getString("lodgement_img_url"));
				object.put("room_name", rs.getString("room_name"));
				object.put("check_in", rs.getString("checkin_date"));
				object.put("check_out", rs.getString("checkout_date"));				
				object.put("charge", rs.getInt("refund_charge"));				
				object.put("state", "예약취소");
				
				info.add(object);
			}
				
			return info;
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			
			return null;
		}
	}
	
	public JSONArray searchCancelationsVer2(String user) {		
		JSONArray info = new JSONArray();
		
		List<String> columnList = Arrays.asList(
				"purchase_id", "cancel_date", 
				"(select lodgement_name from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_name",
				String.format("(select %s from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_img_url", imgURL("lodgement_img_url")),
				"(select room_name from rooms where room_id = reservations.room_id) as room_name", 
				"checkin_date", "checkout_date", "count(*) as room_count");
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
		}};
		
		String sql = select_query("reservations", columnList, condition_hashmap, null, null) + " and cancel_date is not null group by purchase_id";
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JSONObject object = new JSONObject();
				
				object.put("cancel_id", rs.getString("purchase_id"));
				object.put("cancel_date", rs.getString("cancel_date"));
				object.put("lodgement_name", rs.getString("lodgement_name"));
				object.put("lodgement_img_url", rs.getString("lodgement_img_url"));
				object.put("room_name", rs.getString("room_name") + (rs.getInt("room_count") > 1 ? String.format("외 %d", rs.getInt("room_count") - 1) : ""));
				object.put("check_in", rs.getString("checkin_date"));
				object.put("check_out", rs.getString("checkout_date"));							
				object.put("state", "예약취소");
				
				info.add(object);
			}
				
			return info;
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			
			return null;
		}
	}
	
	public JSONObject searchCancelationDetail(String cancelationID) {		
		List<String> columnList = Arrays.asList(
				"cancel_date", 
				"(select lodgement_name from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_name",
				"(select room_name from rooms where room_id = reservations.room_id) as room_name",
				"concat(checkin_date, ' ~ ', checkout_date) as date_string",
				"purchase_id as OID",
				"cancel_reason", "refund_charge");
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("reservation_id", Arrays.asList("value", cancelationID));
		}};
		
		String sql = select_query("reservations", columnList, condition_hashmap, null, null);
		
		System.out.println(sql);
		
		String option_sql = "select option_name from room_options where option_id = ?";
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			rs.next();
		
			JSONObject object = new JSONObject();
				
			object.put("cancelation_date", rs.getString("cancel_date"));
			object.put("lodgement_name", rs.getString("lodgement_name"));
			object.put("room_name", rs.getString("room_name"));
			object.put("date_string", rs.getString("date_string"));
			object.put("OID", rs.getString("OID"));
			object.put("cancel_reason", rs.getString("cancel_reason"));
			object.put("refund_charge", rs.getInt("refund_charge"));
			object.put("state", "예약취소");
				
			return object;
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			
			return null;
		}
	}
	
	public JSONObject searchCancelationDetailVer2(String cancelationID) {		
		List<String> columnList = Arrays.asList(
				"cancel_date", 
				"(select lodgement_name from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_name",
				"json_arrayagg(json_object('checkin_date', checkin_date, 'checkout_date', checkout_date, "
				+ "'room_name', (select room_name from rooms where room_id = reservations.room_id), "
				+ "'room_img_url', (select room_thumb_url from rooms where room_id = reservations.room_id), "
				+ "'option_list', option_list, 'amenity_list', amenity_list, 'room_total_price', total_price)) as rooms",
				"booker_info", "purchase_id as OID",
				"cancel_reason", "refund_charge");
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("purchase_id", Arrays.asList("value", makeString(cancelationID)));
		}};
		
		String sql = select_query("reservations", columnList, condition_hashmap, null, null);
		
		System.out.println(sql);
		
		String option_sql = "select option_name from room_options where option_id = ?";
		String amenity_sql = "select (select amenity_name from room_amenities where amenity_id = ?) as amenity_name, "
				+ "(select amenity_option_name from room_amenity_options where amenity_option_id = ?) as amenity_option_name";			
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			rs.next();
		
			JSONObject object = new JSONObject();
				
			object.put("cancelation_date", rs.getString("cancel_date"));
			object.put("lodgement_name", rs.getString("lodgement_name"));
			object.put("rooms", (JSONArray) JSONValue.parse(rs.getString("rooms")));
			object.put("user_info", (JSONObject) JSONValue.parse(rs.getString("booker_info")));
			object.put("OID", rs.getString("OID"));
			object.put("cancel_reason", rs.getString("cancel_reason"));
			object.put("refund_charge", rs.getInt("refund_charge"));
			object.put("state", "예약취소");
			
			for(int i = 0; i < ((JSONArray) object.get("rooms")).size(); i++) {
				JSONObject room = (JSONObject) ((JSONArray) object.get("rooms")).get(i);
				
				room.put("room_img_url", "https://www.buyinhotel.co.kr/images/" + room.get("room_img_url"));
				
				String optionString = "";
				JSONArray roomOptions = (JSONArray) room.get("option_list");
				
				for(Object option : roomOptions) {
					String optionID = (String) ((JSONObject) option).get("roomOptionID");
					String optionCount = (String) ((JSONObject) option).get("roomOptionCount");
					
					if (!optionCount.equals("0")) {
						psmt = conn.prepareStatement(option_sql);
						psmt.setString(1, optionID);
						rs = psmt.executeQuery();
						
						rs.next();
						
						optionString += String.format("%s : %s\n", rs.getString("option_name"), optionCount);
						
						System.out.println(optionString);
					}
				}
				
				if (optionString.equals("")) {
					optionString = "-";
				} else {
					optionString = optionString.strip();
				}
				
				room.put("room_option", optionString);
				room.remove("option_list");
				
				String amenityString = "";
				JSONArray roomAmenities = (JSONArray) room.get("amenity_list");
				
				for(Object amenity : roomAmenities) {
					String amenityID = (String) ((JSONObject) amenity).get("amenityID");
					String amenityOptionID = (String) ((JSONObject) amenity).get("amenityOptionID");
					
					psmt = conn.prepareStatement(amenity_sql);
					psmt.setString(1, amenityID);
					psmt.setString(2, amenityOptionID);
					rs = psmt.executeQuery();
					
					rs.next();
					
					amenityString += String.format("%s : %s\n", rs.getString("amenity_name"), rs.getString("amenity_option_name"));
					
					System.out.println(amenityString);
				}
				
				if (amenityString.equals("")) {
					amenityString = "-";
				} else {
					amenityString = amenityString.strip();
				}
				
				room.put("room_amenity", amenityString);
				room.remove("amenity_list");
			}
				
			return object;
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			
			return null;
		}
	}
}
