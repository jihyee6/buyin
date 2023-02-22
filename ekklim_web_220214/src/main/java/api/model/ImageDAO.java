package api.model;

import java.sql.SQLException;

import org.json.simple.JSONObject;

public class ImageDAO extends TotalDAO {
	
	public JSONObject searchLodgementImage(String lodgement) {
		
		JSONObject info = new JSONObject();
		
		conn();
		
		String sql = "select lodgement_img_url, lodgement_name from lodgements where lodgement_id = ?";
		
		try {
			
			psmt = conn.prepareStatement(sql);	
			psmt.setString(1, lodgement);
			rs = psmt.executeQuery();
			
			rs.next();
			
			info.put("img_url", "https://www.buyinhotel.co.kr/images/" + rs.getString("lodgement_img_url"));
			info.put("title", rs.getString("lodgement_name"));
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
		
		return info;
		
	}
	
	public JSONObject searchRoomImage(String room) {
		
		JSONObject info = new JSONObject();
		
		conn();
		
		String sql = "select room_thumb_url, room_name, lodgement_id, "
				+ "(select lodgement_name from lodgements where lodgement_id = rooms.lodgement_id) as lodgement_name "
				+ "from rooms where room_id = ?";
		
		try {
			
			psmt = conn.prepareStatement(sql);	
			psmt.setString(1, room);
			rs = psmt.executeQuery();
			
			rs.next();
			
			info.put("img_url", "https://www.buyinhotel.co.kr/images/" + rs.getString("room_thumb_url"));
			info.put("title", rs.getString("lodgement_name") + "(" + rs.getString("room_name") + ")");
			info.put("lodgement_id", rs.getString("lodgement_id"));
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			return null;
		} finally {
			close();
		}
		
		return info;
		
	}
}