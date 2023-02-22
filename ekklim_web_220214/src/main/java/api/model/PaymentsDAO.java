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

public class PaymentsDAO extends TotalDAO {
	
	public JSONObject updatePayments(String user, String OID, String state, String message, String TID) {		
		JSONObject info = new JSONObject();
		
		HashMap<String, String> update_column_value_hashmap;
		
		if(state.equals("true")) {
			update_column_value_hashmap = new HashMap<>() {{
				put("purchase_state", state);
				put("TID", TID);
			}};
		} else {
			update_column_value_hashmap = new HashMap<>() {{
				put("purchase_state", state);
				put("purchase_error", makeString(message));
			}};
		}
		
		HashMap<String, List<String>> update_condition_hashmap = new HashMap<>() {{
			put("purchase_id", Arrays.asList("value", makeString(OID)));
		}};
		
		String payment_type = getPaymentType(OID);
		
		if (payment_type.equals("room")) {
			String update_sql = update_sql = update_query("reservations", update_column_value_hashmap, update_condition_hashmap, false);
			
			List<String> select_column_list = Arrays.asList(
					"(select lodgement_name from lodgements where lodgement_id = (select lodgement_id from rooms where room_id = reservations.room_id)) as lodgement_name",
					"checkin_date", "checkout_date", "booker_info", "payment_method");
			
			HashMap<String, List<String>> select_condition_hashmap = new HashMap<>() {{
				put("purchase_id", Arrays.asList("value", makeString(OID)));
			}};
			
			String select_sql = select_query("reservations", select_column_list, select_condition_hashmap, null, null) + " limit 1";
			
			conn();
			
			try {
				
				psmt = conn.prepareStatement(update_sql);
				psmt.executeUpdate();
				
				
				psmt = conn.prepareStatement(select_sql);
				rs = psmt.executeQuery();
				
				rs.next();
				
				info.put("payment_type", payment_type);
				info.put("checkin_date", rs.getString("checkin_date"));
				info.put("checkout_date", rs.getString("checkout_date"));
				info.put("payment_user_info", (JSONObject) JSONValue.parse(rs.getString("booker_info")));
				info.put("payment_method", rs.getString("payment_method"));
				
				try {
					String fcm_message = String.format("%s %s ~ %s 예약이 완료되었습니다.", rs.getString("lodgement_name"), rs.getString("checkin_date"), rs.getString("checkout_date"));
					
					sendFCM(user, fcm_message);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					
				return info;
				
			} catch (SQLException e) {
				e.printStackTrace();
				close();
				
				return null;
			}
		} else if(payment_type.equals("gift")) {
			String update_sql = update_query("user_gifts", update_column_value_hashmap, update_condition_hashmap, false);
			
			List<String> select_column_list = Arrays.asList(
					"user_id", "gift_name", "sender_info", "receiver_info", "purchase_method");
			
			HashMap<String, List<String>> select_condition_hashmap = new HashMap<>() {{
				put("purchase_id", Arrays.asList("value", makeString(OID)));
			}};
			
			String select_sql = select_query("user_gifts", select_column_list, select_condition_hashmap, null, null);
			
			conn();
			
			try {
				
				psmt = conn.prepareStatement(update_sql);
				psmt.executeUpdate();
				
				
				psmt = conn.prepareStatement(select_sql);
				rs = psmt.executeQuery();
				
				rs.next();
				
				info.put("payment_type", payment_type);
				info.put("payment_user_info", (JSONObject) JSONValue.parse(rs.getString("sender_info")));
				info.put("gift_receiver_info", (JSONObject) JSONValue.parse(rs.getString("receiver_info")));
				info.put("payment_method", rs.getString("purchase_method"));
				
				try {
					String sender_fcm_message = String.format("%s님에게 %s 선물이 완료되었습니다.", 
							((JSONObject) JSONValue.parse(rs.getString("receiver_info"))).get("name"), rs.getString("gift_name"));
					
					if (rs.getString("user_id") != null) {
						String receiver_fcm_message = String.format("%s님이 %s 선물을 보냈습니다.", 
								((JSONObject) JSONValue.parse(rs.getString("sender_info"))).get("name"), rs.getString("gift_name"));
						
						sendFCM(rs.getString("user_id"), receiver_fcm_message);
					}
					
					sendFCM(user, sender_fcm_message);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					
				return info;
				
			} catch (SQLException e) {
				e.printStackTrace();
				close();
				
				return null;
			} 
		} else if(payment_type.equals("giftcard")) {
			String update_sql = update_query("user_giftcards", update_column_value_hashmap, update_condition_hashmap, false);
			
			List<String> select_column_list = Arrays.asList(
					"user_id", "(select giftcard_name from giftcards where giftcard_id = user_giftcards.giftcard_id) as gift_name", "sender_info", "receiver_info", "purchase_method");
			
			HashMap<String, List<String>> select_condition_hashmap = new HashMap<>() {{
				put("purchase_id", Arrays.asList("value", makeString(OID)));
			}};
			
			String select_sql = select_query("user_giftcards", select_column_list, select_condition_hashmap, null, null);
			
			conn();
			
			try {
				
				psmt = conn.prepareStatement(update_sql);
				psmt.executeUpdate();
				
				
				psmt = conn.prepareStatement(select_sql);
				rs = psmt.executeQuery();
				
				rs.next();
				
				info.put("payment_type", payment_type);
				info.put("payment_user_info", (JSONObject) JSONValue.parse(rs.getString("sender_info")));
				info.put("gift_receiver_info", (JSONObject) JSONValue.parse(rs.getString("receiver_info")));
				info.put("payment_method", rs.getString("purchase_method"));
				
				try {
					String sender_fcm_message = String.format("%s님에게 %s 선물이 완료되었습니다.", 
							((JSONObject) JSONValue.parse(rs.getString("receiver_info"))).get("name"), rs.getString("gift_name"));
					
					if (rs.getString("user_id") != null) {
						String receiver_fcm_message = String.format("%s님이 %s 선물을 보냈습니다.", 
								((JSONObject) JSONValue.parse(rs.getString("sender_info"))).get("name"), rs.getString("gift_name"));
						
						sendFCM(rs.getString("user_id"), receiver_fcm_message);
					}
					
					sendFCM(user, sender_fcm_message);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					
				return info;
				
			} catch (SQLException e) {
				e.printStackTrace();
				close();
				
				return null;
			}
		} else {
			return null;
		}

	}
	
	private String getPaymentType(String OID) {
		switch(OID.substring(0, 1)) {
		case "R":
			return "room";
		case "C":
			return "giftcard";
		case "G":
			return "gift";
		default:
			return "other";
		}
	}
}
