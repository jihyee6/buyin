package api.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class MainPageDAO extends TotalDAO {
	
	public JSONObject searchMainPage() {
		
		JSONObject info = new JSONObject();
		
		List<String> event_columnList = Arrays.asList(
				"event_id", imgURL("event_img_url"), imgURL("event_contents_url"));
		
		String event_sql = select_query("events", event_columnList, null, null, null);
		
		
		
		List<String> thumb_columnList = Arrays.asList(
				"lodgement_id", imgURL("lodgement_img_url"), "lodgement_name", "list_price", 
				"(SELECT min(lodge_price) from lodge_2022_03 where room_id in (select room_id from rooms where lodgement_id = lodgements.lodgement_id)) as sale_price", 
				"review_num");
		
		String thumb_sql = select_query("lodgements", thumb_columnList, null, null, null);
		
		
		List<String> ad_columnList = Arrays.asList(
				"ad_id", imgURL("ad_img_url"), imgURL("ad_contents_url"), "ad_name", "ad_point");
		
		String ad_sql = select_query("ads", ad_columnList, null, null, null);
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(event_sql);			
			rs = psmt.executeQuery();
			
			JSONArray event_array = new JSONArray();
			
			while(rs.next()) {
				
				JSONObject jsonObject = makeJSONObject(Arrays.asList("int", "string", "string"));
				
				event_array.add(jsonObject);
			}
			
			info.put("events", event_array);
			
			
			psmt = conn.prepareStatement(thumb_sql);			
			rs = psmt.executeQuery();
			
			JSONArray thumb_array = new JSONArray();
			
			while(rs.next()) {
				
				JSONObject jsonObject = makeJSONObject(Arrays.asList("int", "string", "string", "int", "int", "int"));
				
				jsonObject.put("dc_rate", String.format("%.1f", 100 - (((Integer) jsonObject.get("sale_price")).floatValue() / (Integer) jsonObject.get("list_price")) * 100));
				
				thumb_array.add(jsonObject);
			}
			
			info.put("thumb_lodgements", thumb_array);
			
			
			psmt = conn.prepareStatement(ad_sql);			
			rs = psmt.executeQuery();
			
			JSONArray ad_array = new JSONArray();
			
			while(rs.next()) {
				
				JSONObject jsonObject = makeJSONObject(Arrays.asList("int", "string", "string", "string", "int"));
				
				ad_array.add(jsonObject);
			}
			
			info.put("ads", ad_array);
			
			return info;
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
		
	}
	
}
