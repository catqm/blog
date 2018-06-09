package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dal.Article;
import model.ArticleInfo;

public class ListAllArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		Article article = new Article();
		List<ArticleInfo> a = null;
		try {
			a = article.getAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		HttpSession session= request.getSession();
		session.setAttribute("article", a);

		response.sendRedirect("/blog/public/show.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
