package api.model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class TotalDAO {

	// private 쓰면 안됨!
	Connection conn;  // Connection : 데이터베이스에 접근하게 해주는 하나의 객체 

	PreparedStatement psmt;
	ResultSet rs;
	
	public void conn() { // 생성자를 통해 UserDAO의 인스턴스가 생성되었을 때 자동으로 DB 커넥션이 이루어지도록함
		try {

//			String url = "jdbc:mysql://db-88chd.cdb.ntruss.com:3306/adiot?useSSL=false";//&allowPublicKeyRetrieval=true";
			String url = "jdbc:mysql://db-88chd.pub-cdb.ntruss.com:3306/buyinhotel?useSSL=false";//&allowPublicKeyRetrieval=true";
			String id = "ekklim_user"; // dbID = "root" : root 계정에 접근할 수 있도록 함
			String pw = "adiot0415!@#$"; // 패스워드나 ID를 다르게 입력하면 정상적으로 DB에 접속할 수 없음


			Class.forName("com.mysql.jdbc.Driver"); 
			// Class.forName : mysql driver를 찾을 수 있도록 함 *Driver : mysql에 접속할 수 있도록 매개체 역할을 해주는 하나의 라이브러리 5.1이상은 "com.mysql.cj.jdbc.Driver"

			conn = DriverManager.getConnection(url, id, pw);  //conn : getConnection(db URL, dbID, dbPassword)를 이용하여 DB에 접속하고 접속이 완료가 되면 conn 객체안에 접속된 정보가 담긴다

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public String makeString(String string) {
		return String.format("'%s'", string);
	}

	
	public String imgURL(String url) {
		return String.format("concat('http://www.ekklim.kr/images/', %s) as %s", url, url);
	}

	
	private String condition_clause(HashMap<String, List<String>> condition_hashmap) {
		if (condition_hashmap == null || condition_hashmap.size() == 0) {
			return "";
		}
		
		List<String> conditionList = new ArrayList<>();
		
		Set<String> keySet = condition_hashmap.keySet();
		
		for(String key : keySet) {
			String opt = condition_hashmap.get(key).get(0);
			String value = condition_hashmap.get(key).get(1);
			
			switch (opt) {
			case "value":
				conditionList.add(String.format("%s = %s", key, value));
				break;
			case "like":
				conditionList.add(String.format("%s like '%%%s%%'", key, value));
				break;
			case "in":
				conditionList.add(String.format("%s in (%s)", key, value));
				break;
			case "less":
				conditionList.add(String.format("%s > (%s)", key, value));
				break;
			case "more":
				conditionList.add(String.format("%s < (%s)", key, value));
				break;
			case "not_less":
				conditionList.add(String.format("%s >= (%s)", key, value));
				break;
			case "not_more":
				conditionList.add(String.format("%s <= %s", key, value));
				break;
			case "!value":
				conditionList.add(String.format("%s != %s", key, value));
				break;
			case "null":
				conditionList.add(String.format("%s is null", key));
				break;
			case "not_exists":
				conditionList.add(String.format("not exists %s", value));
				break;
			case "exists":
				conditionList.add(String.format("exists %s", value));
				break;
			}
		}
		
		return String.format("%s", String.join(" and ", conditionList));
	}

	
	private String column_value_clause(HashMap<String, String> column_value_hashmap) {
		if (column_value_hashmap == null || column_value_hashmap.size() == 0) {
			return "";
		}
		
		List<String> column_valueList = new ArrayList<>();
		
		Set<String> keySet = column_value_hashmap.keySet();
		
		for(String key : keySet) {
			String value = column_value_hashmap.get(key);
			
			column_valueList.add(String.format("%s = %s", key, value));
		}
		
		return String.format("%s", String.join(",", column_valueList));
	}
	
	private String lastIndexValue(String[] stringArray) {
		int size = stringArray.length;
		
		return stringArray[size - 1];
	}

	
	public String select_query(String select_table, List<String> column_list, HashMap<String, List<String>> condition_hashmap, String join_query, String group) {
		String query;
		String columns = String.join(",", column_list);
		String conditions = condition_hashmap != null ? " where " + condition_clause(condition_hashmap) : "";
		String joinQuery = join_query != null ? " " + join_query : "";
		String groupString = group != null ? " group by" + group : "";
		
		query = String.format("select %s from %s%s%s%s", columns, select_table, conditions, joinQuery, groupString);
		
		return query;
	}

	
	public String delete_query(String delete_table, HashMap<String, List<String>> condition_hashmap) {
		String query;
		String conditions = condition_hashmap != null ? " where " + condition_clause(condition_hashmap) : "";
		
		query = String.format("delete from %s%s", delete_table, conditions);

		return query;
	}

	
	public String insert_query(String insert_table, List<String> column_list, List<String> value_list, String subquery, Boolean ignore) {
		String query;
		String ignoreString = ignore ? " ignore" : "";
		String columns = String.join(",", column_list);
		String values = subquery != null ? subquery : String.format("values (%s)", String.join(",", value_list));
		
		query = String.format("insert%s into %s(%s) %s", ignoreString, insert_table, columns, values);

		return query;
	}

	
	public String update_query(String update_table, HashMap<String, String> column_value_hashmap, HashMap<String, List<String>> condition_hashmap, Boolean ignore) {
		String query;
		String ignoreString = ignore ? " ignore" : "";
		String column_value = column_value_hashmap != null ? column_value_clause(column_value_hashmap) : "";
		String conditions = condition_hashmap != null ? " where " + condition_clause(condition_hashmap) : "";
		
		query = String.format("update%s %s set %s%s", ignoreString, update_table, column_value, conditions);

		return query;
	}

	
	public String exist_query(String select_table, HashMap<String, List<String>> condition_hashmap) {
		String query;
		String conditions = condition_hashmap != null ? " where " + condition_clause(condition_hashmap) : "";
		
		query = String.format("select if ((select count(*) from %s%s) > 0,'true','false') as result", select_table, conditions);
	
		return query;
	}

	
	public String join_query(String join_table, HashMap<String, List<String>> condition_hashmap) {
		String query;
		String conditions = condition_hashmap != null ? " on " + condition_clause(condition_hashmap) : "";
		
		query = String.format("join %s%s", join_table, conditions);

		return query;
	}

	
	public String json_object_query(List<String> column_list, List<String> extra_column_list) {
		String query;
		String object_string = String.join(",", column_list.stream().map(column -> {
			return String.format("'%s', %s", lastIndexValue(column.split("\\.")), column);
			}).toList());
		
		if(extra_column_list != null) {
			object_string += String.format(",%s", String.join(",", extra_column_list));
		}
		
		query = String.format("json_object(%s)", object_string);

		return query;
	}
	
	
	public String json_arrayagg_query(String json_object_string) {
		String query;
		
		query = String.format("json_arrayagg(%s)", json_object_string);
				
		return query;
	}

	
	public String json_object_insert(JSONObject json_object) {
		String query;
		String object_string = String.join(",", json_object.keySet().stream().map(key -> {
			return String.format("'%s','%s'", key, json_object.get(key));
			}).toList());
		
		query = String.format("json_object(%s)", object_string);
				
		return query;
	}
	
	
	public String json_array_insert(JSONArray json_array) {
		String query;
		String array_string = String.join(",", json_array.stream().map(json_object -> {
			return json_object_insert((JSONObject) json_object);
			}).toList());
		
		query = String.format("json_array(%s)", array_string);
				
		return query;
	}
	
	public JSONObject makeJSONObject(List<String> typeList) throws SQLException {
		JSONObject returnJSONObject = new JSONObject();
		ResultSetMetaData rsmd = rs.getMetaData();
		
		int column_num = Integer.min(rsmd.getColumnCount(), typeList.size());
		
		for (int i=1; i <= column_num; i++) {
			String colmn_name = rsmd.getColumnName(i);
			
			switch (typeList.get(i-1)) {
			case "int": {
				returnJSONObject.put(colmn_name, rs.getInt(colmn_name));
				break;
			}
			case "string": {
				returnJSONObject.put(colmn_name, rs.getString(colmn_name));
				break;
			}
			case "boolean": {
				returnJSONObject.put(colmn_name, rs.getBoolean(colmn_name));
				break;
			}
			case "float": {
				returnJSONObject.put(colmn_name, rs.getFloat(colmn_name));
				break;
			}
			default:
				throw new IllegalArgumentException("Unexpected value: " + typeList.get(i-1));
			}
		}
		
		return returnJSONObject;
	}
	
	public void sendFCM(String user, String message) throws Exception {
		// send FCM
//        final String token = "eg-iKl5aQUS2qkkeetZl8j:APA91bHT3dPWJJu4DpkIl1ofrlui_tEIs1bl6UbzUTne_JqaDFwpnLq_OkmNaQJIDToIM4oa3TLV8rqO_z-3wwXTmt8yvcCDuhpsPg6W7aj-m4Rno2waniKitv6JhgorGRo5sXtLOC6d";
        
//        final String apiKey = "AAAAON4WG1c:APA91bFFBxKynZyuD0TEXyILrj6u0fdrbyqNKfeiwOO2mpYL3qjeN9KSMUH-B4X7975Tr4wr0YUh0auD316ddx3DI7UZ8WkbLGoAnKPXEhGqGH7VNGNa3U_Bu1uWTRcyT6CAXzrsuKK2";
		String select_fcm_token_sql = "select fcm_token from LoginTokens where valid_token = ?";
		
		psmt = conn.prepareStatement(select_fcm_token_sql);
		psmt.setString(1, user);
		rs = psmt.executeQuery();
		
		if (rs.next()) {
			String token = rs.getString("fcm_token");
		
	        final String apiKey = "AAAAhv1R4J0:APA91bG2bqBHu_9vo8Rq2JepfMKOE3mpMjF-bbY_V4c4Cv8mtE03EgXtOfdsq3h2gg14U-HdOvoZdXbvCJ71dsoDlhbz9h8hdYnYteWbES49U8poNFXo7_KoE3xsv422S_49ihvnrJBI";
	        URL url = new URL("https://fcm.googleapis.com/fcm/send");
	        HttpURLConnection httpURLconn = (HttpURLConnection) url.openConnection();
	        httpURLconn.setDoOutput(true);
	        httpURLconn.setRequestMethod("POST");
	        httpURLconn.setRequestProperty("Content-Type", "application/json");
	        httpURLconn.setRequestProperty("Authorization", "key=" + apiKey);
	
	        httpURLconn.setDoOutput(true);
	
	        // 이렇게 보내면 주제를 ALL로 지정해놓은 모든 사람들한테 알림을 날려준다.
	//        String input = "{\"notification\" : {\"title\" : \"여기다 제목 넣기 \", \"body\" : \"여기다 내용 넣기\"}, \"to\":\"/topics/ALL\"}";
	        
	        // 이걸로 보내면 특정 토큰을 가지고있는 어플에만 알림을 날려준다  위에 둘중에 한개 골라서 날려주자
	        String input = "{\"notification\" : {\"title\" : \"바이인호텔\", \"body\" : \"" + message + "\"}, \"to\" : \"" + token + "\"}";
	
	        OutputStream os = httpURLconn.getOutputStream();
	        
	        // 서버에서 날려서 한글 깨지는 사람은 아래처럼  UTF-8로 인코딩해서 날려주자
	        os.write(input.getBytes("UTF-8"));
	        os.flush();
	        os.close();
	
	        int responseCode = httpURLconn.getResponseCode();
	        System.out.println("\nSending 'POST' request to URL : " + url);
	        System.out.println("Post parameters : " + input);
	        System.out.println("Response Code : " + responseCode);
	        
	        BufferedReader in = new BufferedReader(new InputStreamReader(httpURLconn.getInputStream()));
	        String inputLine;
	        StringBuffer response = new StringBuffer();
	
	        while ((inputLine = in.readLine()) != null) {
	            response.append(inputLine);
	        }
	        in.close();
	        
	        System.out.println(response.toString());
		}
	}
	
}
