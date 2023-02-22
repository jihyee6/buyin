package api.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class LodgementsDAO extends TotalDAO {
	
	public JSONArray searchLodgements(String searchName, String searchRegion) {
		
		JSONArray info = new JSONArray();
		
		List<String> columnList = Arrays.asList(
				new String[] {"lodgement_id", imgURL("lodgement_img_url"), "lodgement_name", "list_price", "sale_price", "review_num"});
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("lodgement_name", Arrays.asList("like", searchName));
		}};
		
		conn();
		
		String sql = select_query("lodgements", columnList, condition_hashmap, null, null);
		
		try {
			
			psmt = conn.prepareStatement(sql);			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				JSONObject jsonObject = makeJSONObject(Arrays.asList("int", "string", "string", "int", "int", "int"));
				
				info.add(jsonObject);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return info;
		
	}
	
	public JSONObject searchLodgementDetail(String lodgementID) {
		JSONObject info = new JSONObject();
		
		List<String> columnList = Arrays.asList(
				"lodgement_id", "lodgement_address", "lodgement_tel", "(select sum(room_count) from rooms where lodgement_id = lodgements.lodgement_id) as room_count");
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("lodgement_id", Arrays.asList("value", lodgementID));
		}};
		
		String sql = select_query("lodgements", columnList, condition_hashmap, null, null);
		
		
		
		List<String> room_columnList = Arrays.asList(
				"room_name", "room_amenity", "room_notice");
		
		HashMap<String, List<String>> room_condition_hashmap = new HashMap<>() {{
			put("lodgement_id", Arrays.asList("value", lodgementID));
		}};
		
		String room_sql = select_query("rooms", room_columnList, room_condition_hashmap, null, null);
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(sql);			
			rs = psmt.executeQuery();
			
			rs.next();
				
			JSONObject jsonObject = makeJSONObject(Arrays.asList("int", "string", "string", "int"));
			
			info.putAll(jsonObject);
			
			
			psmt = conn.prepareStatement(room_sql);			
			rs = psmt.executeQuery();
			
			JSONArray room_array = new JSONArray();
			
			while(rs.next()) {	
				JSONObject room_jsonObject = makeJSONObject(Arrays.asList("string", "string", "string"));
				
				room_array.add(room_jsonObject);
			}
			
			info.put("room_infos", room_array);
				
			return info;
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
	}
}
