package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dal.User;
import model.UserInfo;

public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		// 获取用户名和密码
		String _username = request.getParameter("username");
		String _password = request.getParameter("password");

		// System.out.println(_name);
		// System.out.println(_password);

		UserInfo info = new UserInfo();
		User user = new User();
		info = user.getUser(_username);
		String _nickname = info.getNickname();
		
		int flag = 0;

		try {
			flag = user.checkAdminLogin(_username, _password);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (flag == 1) {
			// System.out.println(flag);
			HttpSession session = request.getSession();
			session.setAttribute("nickname",_nickname);
			session.setAttribute("username", _username);
			response.sendRedirect("/blog/admin/bacmage.jsp");
		} else {
			// System.out.println(flag);
			request.setAttribute("msg", "账号或密码错误！");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			// response.sendRedirect("Err.jsp");
		}
	}

}
