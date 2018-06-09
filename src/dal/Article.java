package dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import common.Conn;
import common.DataValidator;
import model.ArticleInfo;

public class Article {
	Conn conn = new Conn();

	// 获取最新博文列表
	public List<ArticleInfo> getNew() throws SQLException {
		List<ArticleInfo> list = new ArrayList<ArticleInfo>();
		String sql = "select a.*,c.name as classname from article a left join class c on a.classid = c.id  order by time desc limit 5";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			ArticleInfo info = new ArticleInfo();
			info.setId(rs.getInt("id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setUsername(rs.getString("username"));
			info.setTime(rs.getDate("time"));
			info.setClassid(rs.getInt("classid"));
			info.setClassname(rs.getString("classname"));
			info.setClick(rs.getInt("click"));
			list.add(info);
		}
		conn.close();
		return list;

	}
	
	// 获取最新博文列表
	public List<ArticleInfo> getHot() throws SQLException {
		List<ArticleInfo> list = new ArrayList<ArticleInfo>();
		String sql = "select a.*,c.name as classname from article a left join class c on a.classid = c.id  order by click desc limit 5";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			ArticleInfo info = new ArticleInfo();
			info.setId(rs.getInt("id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setUsername(rs.getString("username"));
			info.setTime(rs.getDate("time"));
			info.setClassid(rs.getInt("classid"));
			info.setClassname(rs.getString("classname"));
			info.setClick(rs.getInt("click"));
			list.add(info);
		}
		conn.close();
		return list;

	}

	// 获取所有博文列表
	public List<ArticleInfo> getAll() throws SQLException {
		List<ArticleInfo> list = new ArrayList<ArticleInfo>();
		String sql = "select a.*,c.name as classname from article a left join class c on a.classid = c.id order by id desc";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			ArticleInfo info = new ArticleInfo();
			info.setId(rs.getInt("id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setUsername(rs.getString("username"));
			info.setTime(rs.getDate("time"));
			info.setClassid(rs.getInt("classid"));
			info.setClassname(rs.getString("classname"));
			info.setClick(rs.getInt("click"));
			list.add(info);
		}
		conn.close();
		return list;

	}

	// 获取文章列表
	public List<ArticleInfo> getList(String keyword) throws SQLException {
		List<ArticleInfo> list = new ArrayList<ArticleInfo>();
		String sql = "select a.*,c.name as classname from article a left join class c on a.classid = c.id ";
		if (DataValidator.isNullOrEmpty(keyword)) {
			sql = sql + "order by id desc";
		} else {
			sql = sql + "where a.title like '%" + keyword + "%' order by time desc";
		}
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			ArticleInfo info = new ArticleInfo();
			info.setId(rs.getInt("id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setUsername(rs.getString("username"));
			info.setTime(rs.getDate("time"));
			info.setClassid(rs.getInt("classid"));
			info.setClassname(rs.getString("classname"));
			info.setClick(rs.getInt("click"));
			list.add(info);
		}
		conn.close();
		return list;
	}


	// 获取单个用户的文章列表
	public List<ArticleInfo> getListBySomeone(String username) throws SQLException {
		List<ArticleInfo> list = new ArrayList<ArticleInfo>();
		String sql = "select a.*,c.name as classname from article a left join class c on a.classid = c.id where a.username='"
				+username+"' order by time desc";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			ArticleInfo info = new ArticleInfo();
			info.setId(rs.getInt("id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setUsername(rs.getString("username"));
			info.setTime(rs.getDate("time"));
			info.setClassid(rs.getInt("classid"));
			info.setClassname(rs.getString("classname"));
			info.setClick(rs.getInt("click"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	
	// 获取某分类下面的所有博文列表
	public List<ArticleInfo> getListByClassId(int classid) throws SQLException {
		List<ArticleInfo> list = new ArrayList<ArticleInfo>();
		String sql = "select a.*,c.name as classname from article a left join class c on a.classid = c.id where a.classid="
				+ classid + " order by id desc";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			ArticleInfo info = new ArticleInfo();
			info.setId(rs.getInt("id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setUsername(rs.getString("username"));
			info.setTime(rs.getDate("time"));
			info.setClassid(rs.getInt("classid"));
			info.setClassname(rs.getString("classname"));
			info.setClick(rs.getInt("click"));
			list.add(info);
		}
		conn.close();
		return list;
	}

	// 获取单条博文
	public ArticleInfo getArticleInfo(int id) throws SQLException {
		ArticleInfo info = new ArticleInfo();
		String sql = "select a.*,c.name as classname from article a left join class c on a.classid = c.id where a.id="
				+ id + "";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			info.setId(rs.getInt("id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setUsername(rs.getString("username"));
			info.setTime(rs.getDate("time"));
			info.setClassid(rs.getInt("classid"));
			info.setClassname(rs.getString("classname"));
			info.setClick(rs.getInt("click"));
		}
		conn.close();
		return info;
	}

	// 博文插入
	public int insert(ArticleInfo info) {
		Date now = info.getTime();
		long l = now.getTime();
		java.sql.Date sqlDate = new java.sql.Date(l);
		String sql = "insert into article(title,content,username,time,classid)values ";
		sql = sql + "('" + info.getTitle() + "','" + info.getContent() + "','" + info.getUsername() + "','" + sqlDate
				+ "','" + info.getClassid() + "')";
		int result = 0;
		System.out.print(sql);
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}

	// 博文修改
	public int update(ArticleInfo info) {
		Date now = info.getTime();
		long l = now.getTime();
		java.sql.Date sqlDate = new java.sql.Date(l);
		String sql = "update article set" + " title='" + info.getTitle() + "',content='" + info.getContent() + "',time='"
				+ sqlDate + "',Classid=" + info.getClassid() + " where id=" + info.getId() + "";
		int result = 0;
		System.out.print(sql);
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	
	public int updateClick(ArticleInfo info) {
		String sql = "update article set" + " click='" + info.getClick() + "' where id=" + info.getId()+ "";
		int result = 0;
		System.out.print(sql);
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}

	// 博文删除
	public int delete(int id) {
		String sql = "delete from article where id=" + id + "";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
