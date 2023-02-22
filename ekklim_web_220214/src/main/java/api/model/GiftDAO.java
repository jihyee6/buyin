package api.model;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class GiftDAO extends TotalDAO {
	
	public JSONObject searchGiftcardBasicInfo(String user, String giftcardID) {
		
		JSONObject info = new JSONObject();
		
		List<String> gift_columnList = Arrays.asList(
				"giftcard_id as gift_type_id", "giftcard_name as gift_name", "giftcard_price as gift_price", imgURL("giftcard_img_url"));
		
		HashMap<String, List<String>> gift_condition_hashmap = new HashMap<>() {{
			put("giftcard_id", Arrays.asList("value", giftcardID));
		}};
		
		String gift_sql = select_query("giftcards", gift_columnList, gift_condition_hashmap, null, null);
		
		
		List<String> user_columnList = Arrays.asList(
				"user_name", "user_phone_numb as user_tel", "user_email");
		
		HashMap<String, List<String>> user_condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
		}};
		
		String user_sql = select_query("UserData", user_columnList, user_condition_hashmap, null, null);
		
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(gift_sql);			
			rs = psmt.executeQuery();
			
			rs.next();
			
			info.put("gift_type_id", rs.getInt("gift_type_id"));
			info.put("gift_name", rs.getString("gift_name"));
			info.put("gift_img_url", rs.getString("giftcard_img_url"));
			info.put("gift_price", rs.getInt("gift_price"));
			
			psmt = conn.prepareStatement(user_sql);
			rs = psmt.executeQuery();
			
			rs.next();
			
			info.put("user_name", rs.getString("user_name"));
			info.put("user_tel", rs.getString("user_tel"));
			info.put("user_email", rs.getString("user_email"));
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
		
		return info;
		
	}
	
	public JSONObject searchGiftRoomBasicInfo(String user, String room, boolean isWeekend) {
		
		JSONObject info = new JSONObject();
		
		List<String> room_columnList = Arrays.asList(
				"room_id as gift_type_id", "(select lodgement_name from lodgements where lodgement_id = rooms.lodgement_id) as lodgement_name", 
				"room_name", "(select if(?, weekend_price, weekday_price) from gifts where room_id = rooms.room_id) as gift_price", imgURL("room_thumb_url"));
		
		HashMap<String, List<String>> room_condition_hashmap = new HashMap<>() {{
			put("room_id", Arrays.asList("value", room));
		}};
		
		String room_sql = select_query("rooms", room_columnList, room_condition_hashmap, null, null);
		
		
		List<String> user_columnList = Arrays.asList(
				"user_name", "user_phone_numb as user_tel", "user_email");
		
		HashMap<String, List<String>> user_condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
		}};
		
		String user_sql = select_query("UserData", user_columnList, user_condition_hashmap, null, null);
		
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(room_sql);
			psmt.setBoolean(1, isWeekend);
			rs = psmt.executeQuery();
			
			rs.next();
			
			info.put("gift_type_id", rs.getInt("gift_type_id"));
			info.put("gift_name", String.format("[숙박권/%s] %s/%s", isWeekend ? "주말" : "평일", rs.getString("lodgement_name"), rs.getString("room_name")));
			info.put("gift_img_url", rs.getString("room_thumb_url"));
			info.put("gift_price", rs.getInt("gift_price"));
			
			psmt = conn.prepareStatement(user_sql);
			rs = psmt.executeQuery();
			
			rs.next();
			
			info.put("user_name", rs.getString("user_name"));
			info.put("user_tel", rs.getString("user_tel"));
			info.put("user_email", rs.getString("user_email"));
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
		
		return info;
		
	}
	
	
	public String addGiftRoom(String user, String roomID, String isWeekend, String senderInfo, String receiverInfo, String paymentMethod, String paymentCharge) {
		
		List<String> columnList = Arrays.asList("user_id", 
				"user_phone_numb", "sender_id", "room_id", "gift_type", "valid_date",
				"gift_name", "purchase_method", "purchase_id", "purchase_date", "payment_charge",
				"sender_info", "receiver_info");
		
		List<String> valueList = Arrays.asList("(select if(count(*) > 0, user_id, null) from UserData where user_phone_numb = ?)", 
				"?", makeString(user), roomID, isWeekend, "'2022.05.07'",
				"?", makeString(paymentMethod), "?", "now()", paymentCharge,
				json_object_insert((JSONObject) JSONValue.parse(senderInfo)), json_object_insert((JSONObject) JSONValue.parse(receiverInfo)));
		
		
		String sql = insert_query("user_gifts", columnList, valueList, null, false);
		
		int payment_charge = Integer.parseInt(paymentCharge);
		String user_phone_numb = (String) ((JSONObject) JSONValue.parse(receiverInfo)).get("tel");
		
		conn();
		
		try {
			
			String OID = getRoomOID(roomID, user);
			String gift_name = getGiftRoomName(roomID, isWeekend);
			
			if(OID.equals("") || gift_name.equals("")) {
				return null;
			}
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_phone_numb);
			psmt.setString(2, user_phone_numb);
			psmt.setString(3, gift_name);
			psmt.setString(4, OID);
			psmt.executeUpdate();
				
			return OID;
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
	}
	
	private String getRoomOID(String roomID, String user) {
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yy/MM/dd");
		List<Integer> date = Arrays.asList(LocalDate.now().format(dateFormatter).split("/")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		List<Integer> time = Arrays.asList(LocalTime.now().format(timeFormatter).split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		String dateTimeString = String.format("%03d%02d%05d", date.get(0)*12 + date.get(1), date.get(2), time.get(0)*3600 + time.get(1)*60 + time.get(2));
		
		String sql = "select user_nick_name_code from UserData where user_id = ?";
		
		try {
				
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			rs = psmt.executeQuery();
			
			rs.next();
				
			return String.format("G%04d%s%s", Integer.parseInt(roomID), rs.getString("user_nick_name_code"), dateTimeString);
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			
			return "";
		}
	}
	
	private String getGiftRoomName(String roomID, String isWeekend) {
		String sql = "select (select lodgement_name from lodgements where lodgement_id = rooms.lodgement_id) as lodgement_name, room_name from rooms where room_id = ?";
		
		try {
				
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, roomID);
			rs = psmt.executeQuery();
			
			rs.next();
				
			return String.format("[숙박권/%s] %s(%s)", Boolean.parseBoolean(isWeekend) ? "주말" : "평일", rs.getString("lodgement_name"), rs.getString("room_name"));
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			
			return "";
		}
	}
	
	
	public String addGiftcard(String user, String giftcardID, String senderInfo, String receiverInfo, String paymentMethod, String paymentCharge) {
		
		List<String> columnList = Arrays.asList("user_id", 
				"user_phone_numb", "sender_id", "giftcard_id", "valid_date",
				"purchase_method", "purchase_id", "purchase_date", "payment_charge",
				"sender_info", "receiver_info");
		
		List<String> valueList = Arrays.asList("(select if(count(*) > 0, user_id, null) from UserData where user_phone_numb = ?)", 
				"?", makeString(user), giftcardID, "'2022.05.07'",
				makeString(paymentMethod), "?", "now()", paymentCharge,
				json_object_insert((JSONObject) JSONValue.parse(senderInfo)), json_object_insert((JSONObject) JSONValue.parse(receiverInfo)));
		
		
		String sql = insert_query("user_giftcards", columnList, valueList, null, false);
		
		int payment_charge = Integer.parseInt(paymentCharge);
		String user_phone_numb = (String) ((JSONObject) JSONValue.parse(receiverInfo)).get("tel");
		
		conn();
		
		try {
			
			String OID = getGiftcardOID(giftcardID, user);
			
			if(OID.equals("")) {
				return null;
			}
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_phone_numb);
			psmt.setString(2, user_phone_numb);
			psmt.setString(3, OID);
			psmt.executeUpdate();
				
			return OID;
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
	}
	
	private String getGiftcardOID(String roomID, String user) {
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yy/MM/dd");
		List<Integer> date = Arrays.asList(LocalDate.now().format(dateFormatter).split("/")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		List<Integer> time = Arrays.asList(LocalTime.now().format(timeFormatter).split(":")).stream().map(str -> Integer.parseInt(str)).collect(Collectors.toList());
		
		String dateTimeString = String.format("%03d%02d%05d", date.get(0)*12 + date.get(1), date.get(2), time.get(0)*3600 + time.get(1)*60 + time.get(2));
		
		String sql = "select user_nick_name_code from UserData where user_id = ?";
		
		try {
				
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			rs = psmt.executeQuery();
			
			rs.next();
				
			return String.format("C%04d%s%s", Integer.parseInt(roomID), rs.getString("user_nick_name_code"), dateTimeString);
			
		} catch (SQLException e) {
			e.printStackTrace();
			close();
			
			return "";
		}
	}
	
	
	public JSONObject searchGifts(String user) {
		
		JSONObject info = new JSONObject();
		
		List<String> send_columnList = Arrays.asList(
				"user_gift_id as gift_id", "gift_name", "gift_type",
				"(select if(user_gifts.gift_type, weekend_price, weekday_price) from gifts where room_id = user_gifts.room_id) as gift_price", 
				String.format("(select %s from rooms where room_id = user_gifts.room_id) as gift_img_url", imgURL("room_thumb_url")), 
				"(select user_name from UserData where user_phone_numb = user_gifts.user_phone_numb) as gift_receiver",
				"valid_date as gift_valid_date", "use_date");
		
		HashMap<String, List<String>> send_condition_hashmap = new HashMap<>() {{
			put("sender_id", Arrays.asList("value", makeString(user)));
			put("purchase_state", Arrays.asList("value", "1"));
			put("cancel_date", Arrays.asList("null", ""));
		}};
		
		String send_sql = select_query("user_gifts", send_columnList, send_condition_hashmap, null, null);
		
		
		List<String> send_giftcard_columnList = Arrays.asList(
				"user_giftcard_id as gift_id", "giftcard_name as gift_name", "giftcard_price as gift_price", imgURL("giftcard_img_url"),
				"(select user_name from UserData where user_phone_numb = user_giftcards.user_phone_numb) as gift_receiver",
				"valid_date as gift_valid_date", "use_date");
		
		HashMap<String, List<String>> send_giftcard_join_condition_hashmap = new HashMap<>() {{
			put("sender_id", Arrays.asList("value", makeString(user)));
			put("user_giftcards.giftcard_id", Arrays.asList("value", "giftcards.giftcard_id"));
		}};
		
		String send_giftcard_sql = select_query("user_giftcards", send_giftcard_columnList, null, 
				join_query("giftcards", send_giftcard_join_condition_hashmap), null);
		
		
		
		List<String> receive_columnList = Arrays.asList(
				"user_gift_id as gift_id", "gift_name", "gift_type",
				"(select if(user_gifts.gift_type, weekend_price, weekday_price) from gifts where room_id = user_gifts.room_id) as gift_price", 
				String.format("(select %s from rooms where room_id = user_gifts.room_id) as gift_img_url", imgURL("room_thumb_url")), 
				"(select user_name from UserData where user_id = user_gifts.sender_id) as gift_sender",
				"valid_date as gift_valid_date", "use_date");
		
		HashMap<String, List<String>> receive_condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
			put("purchase_state", Arrays.asList("value", "1"));
			put("cancel_date", Arrays.asList("null", ""));
		}};
		
		String receive_sql = select_query("user_gifts", receive_columnList, receive_condition_hashmap, null, null);
		
		
		List<String> receive_giftcard_columnList = Arrays.asList(
				"user_giftcard_id as gift_id", "giftcard_name as gift_name", "giftcard_price as gift_price", imgURL("giftcard_img_url"),
				"(select user_name from UserData where user_id = user_giftcards.sender_id) as gift_sender",
				"valid_date as gift_valid_date", "use_date");
		
		HashMap<String, List<String>> receive_giftcard_join_condition_hashmap = new HashMap<>() {{
			put("user_id", Arrays.asList("value", makeString(user)));
			put("user_giftcards.giftcard_id", Arrays.asList("value", "giftcards.giftcard_id"));
		}};
		
		String receive_giftcard_sql = select_query("user_giftcards", receive_giftcard_columnList, null, 
				join_query("giftcards", receive_giftcard_join_condition_hashmap), null);
		
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(send_sql);		
			rs = psmt.executeQuery();
			
			JSONArray send_array = new JSONArray();
			
			while(rs.next()) {
				JSONObject jsonObject = new JSONObject();
			
				jsonObject.put("gift_id", rs.getInt("gift_id"));
				jsonObject.put("gift_type", String.format("숙박권/%s", rs.getBoolean("gift_type") ? "평일" : "주말"));
				jsonObject.put("gift_name", rs.getString("gift_name"));
				jsonObject.put("gift_img_url", rs.getString("gift_img_url"));
				jsonObject.put("gift_price", rs.getInt("gift_price"));
				jsonObject.put("gift_receiver", rs.getString("gift_receiver") == null ? "(미회원)" : rs.getString("gift_receiver"));
				jsonObject.put("gift_valid_date", rs.getString("gift_valid_date"));
				jsonObject.put("gift_state", rs.getString("use_date") == null ? "사용전" : "사용 완료");
				
				send_array.add(jsonObject);
			}
			
			psmt = conn.prepareStatement(send_giftcard_sql);		
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JSONObject jsonObject = new JSONObject();
			
				jsonObject.put("gift_id", rs.getInt("gift_id"));
				jsonObject.put("gift_type", "기프트카드");
				jsonObject.put("gift_name", rs.getString("gift_name"));
				jsonObject.put("gift_img_url", rs.getString("giftcard_img_url"));
				jsonObject.put("gift_price", rs.getInt("gift_price"));
				jsonObject.put("gift_receiver", rs.getString("gift_receiver") == null ? "(미회원)" : rs.getString("gift_receiver"));
				jsonObject.put("gift_valid_date", rs.getString("gift_valid_date"));
				jsonObject.put("gift_state", rs.getString("use_date") == null ? "사용전" : "사용 완료");
				
				send_array.add(jsonObject);
			}
			
			info.put("gift_sends", send_array);
			
			psmt = conn.prepareStatement(receive_sql);		
			rs = psmt.executeQuery();
			
			JSONArray receive_array = new JSONArray();
			
			while(rs.next()) {
				JSONObject jsonObject = new JSONObject();
			
				jsonObject.put("gift_id", rs.getInt("gift_id"));
				jsonObject.put("gift_type", String.format("숙박권/%s", rs.getBoolean("gift_type") ? "평일" : "주말"));
				jsonObject.put("gift_name", rs.getString("gift_name"));
				jsonObject.put("gift_img_url", rs.getString("gift_img_url"));
				jsonObject.put("gift_price", rs.getInt("gift_price"));
				jsonObject.put("gift_sender", rs.getString("gift_sender"));
				jsonObject.put("gift_valid_date", rs.getString("gift_valid_date"));
				jsonObject.put("gift_state", rs.getString("use_date") == null ? "사용전" : "사용 완료");
				
				receive_array.add(jsonObject);
			}
			
			psmt = conn.prepareStatement(receive_giftcard_sql);		
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JSONObject jsonObject = new JSONObject();
			
				jsonObject.put("gift_id", rs.getInt("gift_id"));
				jsonObject.put("gift_type", "기프트카드");
				jsonObject.put("gift_name", rs.getString("gift_name"));
				jsonObject.put("gift_img_url", rs.getString("giftcard_img_url"));
				jsonObject.put("gift_price", rs.getInt("gift_price"));
				jsonObject.put("gift_sender", rs.getString("gift_sender"));
				jsonObject.put("gift_valid_date", rs.getString("gift_valid_date"));
				jsonObject.put("gift_state", rs.getString("use_date") == null ? "사용전" : "사용 완료");
				
				receive_array.add(jsonObject);
			}
			
			info.put("gift_receives", receive_array);
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
		
		return info;
		
	}
	
	public JSONObject searchGiftSendDetail(String user, String gift, String giftType) {
		JSONObject info = new JSONObject();
		
		if (!giftType.equals("기프트카드")) {
			List<String> column_list = Arrays.asList(
					"user_gift_id as gift_id", "gift_name", "gift_type", "room_id", 
					String.format("(select %s from rooms where room_id = user_gifts.room_id) as gift_img_url", imgURL("room_thumb_url")), 
					"(select if(user_gifts.gift_type, weekend_price, weekday_price) from gifts where room_id = user_gifts.room_id) as gift_price", 
					"(select user_name from UserData where user_phone_numb = user_gifts.user_phone_numb) as gift_receiver",
					"user_phone_numb as gift_receiver_tel",	"valid_date as gift_valid_date", "use_date", "purchase_id", "purchase_date", "purchase_method");
			
			HashMap<String, List<String>> send_condition_hashmap = new HashMap<>() {{
				put("user_gift_id", Arrays.asList("value", gift));
			}};
			
			String sql = select_query("user_gifts", column_list, send_condition_hashmap, null, null);
			
			conn();
			
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				
				rs.next();
				
				info.put("gift_id", rs.getInt("gift_id"));
				info.put("gift_name", rs.getString("gift_name"));
				info.put("gift_type", String.format("숙박권/%s", rs.getBoolean("gift_type") ? "평일" : "주말"));
				info.put("room_id", rs.getInt("room_id"));
				info.put("gift_img_url", rs.getString("gift_img_url"));
				info.put("gift_price", rs.getInt("gift_price"));
				info.put("gift_receiver", rs.getString("gift_receiver") == null ? "(미회원)" : rs.getString("gift_receiver"));
				info.put("gift_receiver_tel", rs.getObject("gift_receiver_tel"));
				info.put("gift_valid_date", rs.getObject("gift_valid_date"));
				info.put("gift_state", rs.getString("use_date") == null ? "사용전" : "사용 완료");
				info.put("purchase_id", rs.getObject("purchase_id"));
				info.put("purchase_date", rs.getObject("purchase_date"));
				info.put("purchase_method", rs.getObject("purchase_method"));
				info.put("purchase_charge", rs.getInt("gift_price"));
				
				return info;
				
			} catch (Exception e) {
				e.printStackTrace();
				
				return null;
			} finally {
				close();
			}
		} else {
			List<String> columnList = Arrays.asList(
					"user_giftcard_id as gift_id", "giftcard_name as gift_name", "giftcard_price as gift_price", imgURL("giftcard_img_url"),
					"(select user_name from UserData where user_phone_numb = user_giftcards.user_phone_numb) as gift_receiver",
					"user_phone_numb as gift_receiver_tel",	"valid_date as gift_valid_date", "use_date", "purchase_id", "purchase_date", "purchase_method");
			
			HashMap<String, List<String>> join_condition_hashmap = new HashMap<>() {{
				put("user_giftcard_id", Arrays.asList("value", gift));
				put("user_giftcards.giftcard_id", Arrays.asList("value", "giftcards.giftcard_id"));
			}};
			
			String sql = select_query("user_giftcards", columnList, null, 
					join_query("giftcards", join_condition_hashmap), null);
			
			conn();
			
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				
				rs.next();
				
				info.put("gift_id", rs.getInt("gift_id"));
				info.put("gift_name", rs.getString("gift_name"));
				info.put("gift_type", "기프트카드");
				info.put("gift_img_url", rs.getString("giftcard_img_url"));
				info.put("gift_price", rs.getInt("gift_price"));
				info.put("gift_receiver", rs.getString("gift_receiver") == null ? "(미회원)" : rs.getString("gift_receiver"));
				info.put("gift_receiver_tel", rs.getObject("gift_receiver_tel"));
				info.put("gift_valid_date", rs.getObject("gift_valid_date"));
				info.put("gift_state", rs.getString("use_date") == null ? "사용전" : "사용 완료");
				info.put("purchase_id", rs.getObject("purchase_id"));
				info.put("purchase_date", rs.getObject("purchase_date"));
				info.put("purchase_method", rs.getObject("purchase_method"));
				info.put("purchase_charge", rs.getInt("gift_price"));
				
				return info;
				
			} catch (Exception e) {
				e.printStackTrace();
				
				return null;
			} finally {
				close();
			}
		}
	}
	
	
	public JSONObject searchGiftReceiveDetail(String user, String gift, String giftType) {
		JSONObject info = new JSONObject();
		
		if (!giftType.equals("기프트카드")) {
			List<String> column_list = Arrays.asList(
					"user_gift_id as gift_id", "gift_name", "gift_type", "room_id", 
					String.format("(select %s from rooms where room_id = user_gifts.room_id) as gift_img_url", imgURL("room_thumb_url")), 
					"(select if(user_gifts.gift_type, weekend_price, weekday_price) from gifts where room_id = user_gifts.room_id) as gift_price", 
					"(select user_name from UserData where user_id = user_gifts.sender_id) as gift_sender",
					"valid_date as gift_valid_date", "use_date");
			
			HashMap<String, List<String>> send_condition_hashmap = new HashMap<>() {{
				put("user_gift_id", Arrays.asList("value", gift));
			}};
			
			String sql = select_query("user_gifts", column_list, send_condition_hashmap, null, null);
			
			conn();
			
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				
				rs.next();
				
				info.put("gift_id", rs.getInt("gift_id"));
				info.put("gift_name", rs.getString("gift_name"));
				info.put("gift_type", String.format("숙박권/%s", rs.getBoolean("gift_type") ? "평일" : "주말"));
				info.put("room_id", rs.getInt("room_id"));
				info.put("gift_img_url", rs.getString("gift_img_url"));
				info.put("gift_price", rs.getInt("gift_price"));
				info.put("gift_sender", rs.getString("gift_sender"));
				info.put("gift_valid_date", rs.getObject("gift_valid_date"));
				info.put("gift_usage", "온라인");
				info.put("gift_state", rs.getString("use_date") == null ? "사용전" : "사용 완료");
				
				return info;
				
			} catch (Exception e) {
				e.printStackTrace();
				
				return null;
			} finally {
				close();
			}
		} else {
			List<String> columnList = Arrays.asList(
					"user_giftcard_id as gift_id", "giftcard_name as gift_name", "giftcard_price as gift_price", imgURL("giftcard_img_url"),
					"(select user_name from UserData where user_id = user_giftcards.sender_id) as gift_sender",
					"valid_date as gift_valid_date", "use_date", "purchase_id", "purchase_date", "purchase_method");
			
			HashMap<String, List<String>> join_condition_hashmap = new HashMap<>() {{
				put("user_giftcard_id", Arrays.asList("value", gift));
				put("user_giftcards.giftcard_id", Arrays.asList("value", "giftcards.giftcard_id"));
			}};
			
			String sql = select_query("user_giftcards", columnList, null, 
					join_query("giftcards", join_condition_hashmap), null);
			
			conn();
			
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				
				rs.next();
				
				info.put("gift_id", rs.getInt("gift_id"));
				info.put("gift_name", rs.getString("gift_name"));
				info.put("gift_type", "기프트카드");
				info.put("gift_img_url", rs.getString("giftcard_img_url"));
				info.put("gift_price", rs.getInt("gift_price"));
				info.put("gift_sender", rs.getString("gift_sender"));
				info.put("gift_valid_date", rs.getObject("gift_valid_date"));
				info.put("gift_usage", "온라인");
				info.put("gift_state", rs.getString("use_date") == null ? "사용전" : "사용 완료");
				
				return info;
				
			} catch (Exception e) {
				e.printStackTrace();
				
				return null;
			} finally {
				close();
			}
		}
	}
	
	
}
