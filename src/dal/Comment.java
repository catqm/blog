package dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.Conn;
import model.CommentInfo;

public class Comment {
	Conn conn = new Conn();

	//获取博文评论列
		public List<CommentInfo> getList() throws SQLException{
			List<CommentInfo> list = new ArrayList<CommentInfo>();
			String sql = "select * from comment order by id desc";
			ResultSet rs = conn.executeQuery(sql);
			while(rs.next()){
				CommentInfo info = new CommentInfo();
				info.setId(rs.getInt("id"));
				info.setContent(rs.getString("content"));
				info.setAid(rs.getInt("aid"));
				info.setUsername(rs.getString("username"));
				list.add(info);
			}
			conn.close();
			return list;
		}
		
		//获得单条评论信息
		public CommentInfo getCommentInfo(int id) throws SQLException{
			CommentInfo info = new CommentInfo();
			String sql = "select * from comment c where id="+id+"";
			ResultSet rs = conn.executeQuery(sql);
			if(rs.next()){
				info.setId(rs.getInt("id"));
				info.setContent(rs.getString("content"));
				info.setAid(rs.getInt("aid"));
				info.setUsername(rs.getString("username"));
			}
			conn.close();
			return info;
		}
		
		//获得某博文的所有评论
		public List<CommentInfo> getListByArticleId(int aid) throws SQLException{
			List<CommentInfo> list = new ArrayList<CommentInfo>();
			String sql = "select * from comment where aid=" + aid + " order by id desc" ;
			ResultSet rs = conn.executeQuery(sql);
			while(rs.next()){
				CommentInfo info = new CommentInfo();
				info.setId(rs.getInt("id"));
				info.setContent(rs.getString("content"));
				info.setAid(rs.getInt("aid"));
				info.setUsername(rs.getString("username"));
				list.add(info);
			}
			conn.close();
			return list;
		}
		
		//博文评论插入
		public int insert(CommentInfo info){
			String sql = "insert into comment(content,aid,username) values ";
			sql = sql+"('"+info.getContent()+"',"+info.getAid()+",'"+info.getUsername()+"')";
			int result = 0;
			System.out.println(sql);
			result = conn.executeUpdate(sql);
			conn.close();
			return result;
		}
		
		//博文评论修改
		public int update(CommentInfo info){
			String sql = "update comment set "+"context='"+info.getContent()+"',aid="
					+info.getAid()+ "' where id="+info.getId()+"";
			int result = 0;
			result = conn.executeUpdate(sql);
			System.out.println(sql);
			conn.close();
			return result;
		}
		
		//博文评论删除
		public int delete(int id){
			String sql = "delete from Comment where id="+id+"";
			int result = 0;
			result = conn.executeUpdate(sql);
			conn.close();
			return result;
		}
}
