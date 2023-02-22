package controller;

import java.util.regex.Pattern;

public class PwCheck {
	
public String regexPw(String pw) {
		
		String result = null;
		Boolean isValid = false;
		
		String pattern = "^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$";

		isValid = Pattern.matches(pattern, pw);
		
		if(!isValid) {
			result = "Regex";
		} else {		
			result = "Success";
			
		}

		return result;
	}

	public Boolean regexPwSession(String pw) {
		String pattern = "^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$";
		Boolean isValid = false;

		isValid = Pattern.matches(pattern, pw);
		
		if(!isValid) {
			isValid = false;
		} else {		
			isValid = true;
		}
		
		return isValid;
	}
	
	public String rePw(String pw, String pwRe) {
		
		String result = null;
		
		if(!pw.equals(pwRe)) {
			result = "Match";
		} else {
			result = "Success";
		}

		return result;
	}

	public Boolean rePwSession(String pw, String pwRe) {

		Boolean isValid;
		
		if(!pw.equals(pwRe)) {
			isValid = false;
		} else {
			isValid = true;
		}
		
		return isValid;
	}

}
