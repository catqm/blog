package common;
import java.sql.*;
public class Conn {  //���ݿ�������
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	//������������
	public Conn(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(java.lang.ClassNotFoundException e){
			System.err.println(e.getMessage());
		}
	}
	
	//ִ�в�ѯ������select
	public ResultSet executeQuery(String sql){
		try{
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/blog?useUnicode=true&amp;characterEncoding=UTF-8","root","root");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		}catch(SQLException ex){
			System.err.println(ex.getMessage());
		}
		return rs;
	}
	
	//ִ�и��²�����insert��update��delete
	public int executeUpdate(String sql){
		int result = 0;
		try{
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/blog?useUnicode=true&amp;characterEncoding=UTF-8","root","root");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);
		}catch(SQLException ex){
			result = 0;
		}
		return result;
	}
	
	//�ر����ݿ�����
	public void close(){
		try{
			if(rs!=null){
				rs.close();
			}
		}catch(Exception e){
			e.printStackTrace(System.err);
		}
		try{
			if(stmt!=null){
				stmt.close();
			}
		}catch(Exception e){
			e.printStackTrace(System.err);
		}
		try{
			if(conn!=null){
				conn.close();
			}
		}catch(Exception e){
			e.printStackTrace(System.err);
		}
	}
}
