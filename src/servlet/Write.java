package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Utility;
import dal.Article;
import dal.Class;
import model.ArticleInfo;

public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Write() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		// 标题和内容
		String _nickname=(String) session.getAttribute("nickname");
		String _username=(String) session.getAttribute("username");
		String _title = request.getParameter("title");
		String _content = request.getParameter("content");
		
		
		Date _time = Utility.getNowDateTime();
		
		String cid = request.getParameter("classid");
		int _classid = Integer.parseInt(cid);
		
		String _cname = "";
		Class class1 = new Class();
		try {
			_cname = class1.getClassname(_classid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		Article article = new Article();
		ArticleInfo info = new ArticleInfo();
		
		info.setUsername(_username);
		info.setContent(_content);
		info.setTitle(_title);
		info.setTime(_time);
		info.setClassid(_classid);
		info.setClassname(_cname);
		
		article.insert(info);
		
		request.setAttribute("title",_title);
		request.setAttribute("content", _content);
		request.setAttribute("classname", _cname);
		request.setAttribute("time", _time);
		request.setAttribute("username", _username);
		request.setAttribute("nickname", _nickname);
		request.getRequestDispatcher("/user/read.jsp").forward(request, response);
		
	}

}
