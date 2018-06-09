package dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.Conn;
import model.ClassInfo;

public class Class {
	Conn conn = new Conn();

	// 获取博文分类列表
	public List<ClassInfo> getList() throws SQLException {
		List<ClassInfo> list = new ArrayList<ClassInfo>();
		String sql = "select * from class";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			ClassInfo info = new ClassInfo();
			info.setId(rs.getInt("id"));
			info.setName(rs.getString("name"));
			list.add(info);
		}
		conn.close();
		return list;
	}

	// 获得单条分类信息
	public ClassInfo getClassInfo(int id) throws SQLException {
		ClassInfo info = new ClassInfo();
		String sql = "select * from class c where id=" + id + "";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			info.setId(rs.getInt("id"));
			info.setName(rs.getString("name"));
		}
		conn.close();
		return info;
	}

	// 获得单条分类信息
	public String getClassname(int id) throws SQLException {
		ClassInfo info = new ClassInfo();
		String sql = "select * from class c where id=" + id + "";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			info.setName(rs.getString("name"));
		}
		conn.close();
		return info.getName();
	}

	// 博文分类插入
	public int insert(ClassInfo info) {
		String sql = "insert into class(name) values";
		sql = sql + "('" + info.getName() + "')";
		int result = 0;
		result = conn.executeUpdate(sql);
		System.out.println(sql);
		conn.close();
		return result;
	}

	// 博文分类修改
	public int update(ClassInfo info) {
		String sql = "update class set " + "name='" + info.getName() + "' where id=" + info.getId() + "";
		int result = 0;
		result = conn.executeUpdate(sql);
		System.out.println(sql);
		conn.close();
		return result;
	}

	// 博文分类删除
	public int delete(int id) {
		String sql = "delete from class where id=" + id + "";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
