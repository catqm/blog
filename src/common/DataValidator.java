package common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DataValidator {
	//��֤�ַ����Ƿ�Ϊ��
	public static boolean isNullOrEmpty(String input){
		return "".equals(input) || input == null;
	}
	
	//ƥ��������ʽ
	public static boolean regexMatch(String input,String pattern){
		if(isNullOrEmpty(input)){
			return false;
		}
		return Pattern.compile(pattern).matcher(input).matches();
	}
	
	//HTML���룬֧�ֻ��з�
	public static String htmlEncode(String input){
		if(!DataValidator.isNullOrEmpty(input)){
			input = input.replace("&", "&amp;");
			input = input.replace("<", "&lt;");
			input = input.replace(">", "&gt;");
			input = input.replace("'", "&#39;");
			input = input.replace("\"", "&quot;");
			input = input.replace("\r\n", "<br>");
			input = input.replace("\n", "<br>");
		}
		return input;
	}
	
	//HTML�����룬֧�ֻ��з�
	public static String htmlDecode(String input){
		if(!DataValidator.isNullOrEmpty(input)){
			return input;
		}
		input = input.replace("&amp;", "&");
		input = input.replace("&lt;", "<");
		input = input.replace("&gt;", ">");
		input = input.replace("&#39;", "'");
		input = input.replace("&quot;", "\"");
		input = input.replace("<br>", "\n");
		return input;
	}
	
	//HTML���룬��֧�ֻ��з�
	public static String serverHtmlEncode(String input){
		if(!DataValidator.isNullOrEmpty(input)){
			input = input.replace("&", "&amp;");
			input = input.replace("<", "&lt;");
			input = input.replace(">", "&gt;");
			input = input.replace("'", "&#39;");
			input = input.replace("\"", "&quot;");
		}
		return input;
	}
	
	//HTML�����룬��֧�ֻ��з�
	public static String serverHtmlDecode(String input){
		if(!DataValidator.isNullOrEmpty(input)){
			return input;
		}
		input = input.replace("&amp;", "&");
		input = input.replace("&lt;", "<");
		input = input.replace("&gt;", ">");
		input = input.replace("&#39;", "'");
		input = input.replace("&quot;", "\"");
		return input;
	}
	
	//��������HTML����
	public static String removeHtml(String input){
		if(!DataValidator.isNullOrEmpty(input)){
			return input;
		}
		Pattern p = Pattern.compile("<[^>]*>", Pattern.MULTILINE | Pattern.UNICODE_CASE);
		Matcher m = p.matcher(input);
		return m.replaceAll("");
	}
}
