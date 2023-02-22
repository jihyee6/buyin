package api.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class GiftcardsDAO extends TotalDAO {
	
	public JSONArray searchGiftcards() {
		
		JSONArray info = new JSONArray();
		
		List<String> columnList = Arrays.asList(
				"giftcard_id", "giftcard_name", "giftcard_price", imgURL("giftcard_img_url"));
		
		conn();
		
		String sql = select_query("giftcards", columnList, null, null, null);
		
		try {
			
			psmt = conn.prepareStatement(sql);			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				JSONObject jsonObject = makeJSONObject(Arrays.asList("int", "string", "int", "string"));
				
				info.add(jsonObject);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
		
		return info;
		
	}
	
	public JSONObject searchGiftcardInfo(String giftcardID) {
		
		JSONObject info = new JSONObject();
		
		List<String> columnList = Arrays.asList(
				"giftcard_id", "giftcard_name", "giftcard_price", imgURL("giftcard_img_url"), "valid_period", imgURL("giftcard_detail_img_url"));
		
		HashMap<String, List<String>> condition_hashmap = new HashMap<>() {{
			put("giftcard_id", Arrays.asList("value", giftcardID));
		}};
		
		conn();
		
		String sql = select_query("giftcards", columnList, condition_hashmap, null, null);
		
		try {
			
			psmt = conn.prepareStatement(sql);			
			rs = psmt.executeQuery();
			
			rs.next();
				
			JSONObject jsonObject = makeJSONObject(Arrays.asList("int", "string", "int", "string", "string", "string"));
			
			info.putAll(jsonObject);
			info.put("giftcard_usage", "온라인");
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
		
		return info;
		
	}
}
