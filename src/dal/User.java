package dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.Conn;
import model.UserInfo;

public class User {
	Conn conn = new Conn();

	// 获取用户列表
	public List<UserInfo> getList() throws SQLException {
		List<UserInfo> list = new ArrayList<UserInfo>();
		String sql = "select * from user order by username asc";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			UserInfo info = new UserInfo();
			info.setUsername(rs.getString("username"));
			info.setPassword(rs.getString("password"));
			info.setNickname(rs.getString("nickname"));
			info.setQuestion(rs.getString("question"));
			info.setAnswer(rs.getString("answer"));
			info.setPower(rs.getString("power"));
			list.add(info);
		}
		conn.close();
		return list;
	}

	// 通过username,获取用户信息
	public UserInfo getUser(String username) {
		List<UserInfo> list = new ArrayList<UserInfo>();
		String sql = "select * from user u where username='" + username + "'";
		ResultSet rs = conn.executeQuery(sql);
		UserInfo info = new UserInfo();
		try {
			while (rs.next()) {
				info.setUsername(rs.getString("username"));
				info.setPassword(rs.getString("password"));
				info.setNickname(rs.getString("nickname"));
				info.setQuestion(rs.getString("question"));
				info.setAnswer(rs.getString("answer"));
				info.setPower(rs.getString("power"));
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return info;
	}

	// 判断用户登陆信息的正确
	public int checkLogin(String username, String password) throws SQLException {
		int flag = 0;
		UserInfo info = new UserInfo();
		String sql = "select * from user u where username='" + username + "'";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			info.setUsername(rs.getString("username"));
			info.setPassword(rs.getString("password"));
		}
		// System.out.println(info.getPassword());
		// System.out.println(password);
		if (info.getPassword().equals(password)) {
			flag = 1;
		}
		conn.close();
		return flag;
	}

	// 判断管理员登陆信息的正确
	public int checkAdminLogin(String username, String password) throws SQLException {
		int flag = 0;
		UserInfo info = new UserInfo();
		String sql = "select * from user u where username='" + username + "'";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			info.setUsername(rs.getString("username"));
			info.setPassword(rs.getString("password"));
			info.setPower(rs.getString("power"));
		}
		// System.out.println(info.getPassword());
		// System.out.println(password);
		if (info.getPassword().equals(password) && info.getPower().equals("admin")) {
			flag = 1;
		}
		conn.close();
		return flag;
	}

	// 用户插入
	public int insert(UserInfo info) {
		String sql = "insert into user(username,password,nickname,question,answer,power) values";
		sql = sql + "('" + info.getUsername() + "','" + info.getPassword() + "','" + info.getNickname() + "','"
				+ info.getQuestion() + "','" + info.getAnswer() + "','user')";
		int result;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}

	// 用户修改
	public int update(UserInfo info) {
		String sql = "update user set nickname='" + info.getNickname() + "',power='" + info.getPower()
				 + "'where username ='" + info.getUsername() + "'";
		int result = 0;
		result = conn.executeUpdate(sql);
		System.out.print(sql);
		conn.close();
		return result;
	}

	// 用户删除
	public int delete(String username) {
		String sql = "delete from user where username ='" + username + "'";
		int result;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
