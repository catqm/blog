package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dal.Comment;
import model.CommentInfo;

public class InputComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String content = request.getParameter("content");
		int aid = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		if (username == null) {
			request.setAttribute("msg", "Äú»¹Ã»ÓÐµÇÂ¼");
			request.getRequestDispatcher("blog/public/index.jsp");
			return;
		} else {
			Comment comment = new Comment();
			CommentInfo info = new CommentInfo();
			info.setAid(aid);
			info.setContent(content);
			info.setUsername(username);
			comment.insert(info);

			request.getRequestDispatcher("/public/read.jsp").forward(request, response);
		}
	}

}
