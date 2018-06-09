package common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DataConverter {
	//将日期格式化为字符串
	public static String dataToString(Date date){
		return dataToString(date,"yyyy-MM-dd HH:mm:ss");
	}

	//将日期格式化为字符串
	private static String dataToString(Date date, String formatType) {
		if(date == null){
			date = Utility.getNowDateTime();
		}
		SimpleDateFormat formatter = new SimpleDateFormat(formatType);
		return formatter.format(date);
	}
	
	//将字符串转成日期
	public static Date toDate(String input,String formatType){
		SimpleDateFormat format = new SimpleDateFormat(formatType);
		Date dt = new Date();
		if(DataValidator.isNullOrEmpty(input)){
			return dt;
		}
		try{
			dt = format.parse(input);
		}catch(ParseException e){
		}
		return dt;
	}
	
	//将字符串转成短日期格式 yyyy-MM-dd
	public static java.util.Date toShortDate(String input){
		return toDate(input,"yyyy-MM-dd");
	}
	
	//将字符串转成长日期格式 yyyy-MM-dd HH:mm:ss
	public static java.util.Date toFullDate(String input){
		return toDate(input,"yyyy-MM-dd HH:mm:ss");
	}
	
	//将字符串转成整型
	public static int toInt(String input){
		try{
			return Integer.parseInt(input);
		}catch(Exception e){
			return 0;
		}
	}
}
