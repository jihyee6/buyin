package api.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class CommonInfoDAO extends TotalDAO {
	
	public JSONObject searchCommonInfo(String user) {
		
		JSONObject info = new JSONObject();
		
		if (user == null) {
			return info;
		}
		
		String sql = "select count(*) as shopbasket_num from shopbaskets where user_id = ? and just_reserve = 0";
		
		conn();
		
		try {
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			rs = psmt.executeQuery();
			
			rs.next();
				
			info.put("shopbasket_num", rs.getInt("shopbasket_num"));
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return info;		
	}
}
