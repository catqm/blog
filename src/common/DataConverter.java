package common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DataConverter {
	//�����ڸ�ʽ��Ϊ�ַ���
	public static String dataToString(Date date){
		return dataToString(date,"yyyy-MM-dd HH:mm:ss");
	}

	//�����ڸ�ʽ��Ϊ�ַ���
	private static String dataToString(Date date, String formatType) {
		if(date == null){
			date = Utility.getNowDateTime();
		}
		SimpleDateFormat formatter = new SimpleDateFormat(formatType);
		return formatter.format(date);
	}
	
	//���ַ���ת������
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
	
	//���ַ���ת�ɶ����ڸ�ʽ yyyy-MM-dd
	public static java.util.Date toShortDate(String input){
		return toDate(input,"yyyy-MM-dd");
	}
	
	//���ַ���ת�ɳ����ڸ�ʽ yyyy-MM-dd HH:mm:ss
	public static java.util.Date toFullDate(String input){
		return toDate(input,"yyyy-MM-dd HH:mm:ss");
	}
	
	//���ַ���ת������
	public static int toInt(String input){
		try{
			return Integer.parseInt(input);
		}catch(Exception e){
			return 0;
		}
	}
}
