package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dal.User;
import model.UserInfo;

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Register() {
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

		String _username = request.getParameter("username");
		String _password = request.getParameter("password");
		String _password2 = request.getParameter("repassword");
		String _nickname = request.getParameter("nickname");
		String _question = request.getParameter("question");
		String _answer = request.getParameter("answer");

		if (_username == null || _username.trim().isEmpty()) {
			request.setAttribute("msg1", "帐号不能为空");
			request.getRequestDispatcher("/public/register.jsp").forward(request, response);
			return;
		}
		if (_password == null || _password.trim().isEmpty()) {
			request.setAttribute("msg2", "密码不能为空");
			request.getRequestDispatcher("/public/register.jsp").forward(request, response);
			return;
		}
		if (!_password.equals(_password2)) {
			request.setAttribute("msg3", "两次输入的密码不同");
			request.getRequestDispatcher("/public/register.jsp").forward(request, response);
			return;
		}
		if (_nickname == null || _nickname.trim().isEmpty()) {
			_nickname = _username;
			return;
		}

		if (_username != null || _password.equals(_password2)) {
			User user = new User();
			UserInfo info = new UserInfo();

			info.setUsername(_username);
			info.setPassword(_password);
			info.setNickname(_nickname);
			info.setQuestion(_question);
			info.setAnswer(_answer);

			user.insert(info);
			HttpSession session = request.getSession();
			session.setAttribute("nickname", _nickname);
			session.setAttribute("username", _username);
			response.sendRedirect("/blog/user/home.jsp");
		}
	}

}
