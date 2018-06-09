package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dal.Article;
import model.ArticleInfo;

public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String _str = request.getParameter("search");

		Article article = new Article();
		List<ArticleInfo> a = null;
		try {
			a = article.getList(_str);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("article", a);

		request.getRequestDispatcher("/public/result.jsp").forward(request, response);

	}

}
