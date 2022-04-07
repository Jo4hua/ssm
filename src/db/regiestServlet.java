package db;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.User;

/**
 * Servlet implementation class regiestServlet
 */
@WebServlet("/regiestServlet")
public class regiestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public regiestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html;charset=UTF-8");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String age=request.getParameter("age");
		String local=request.getParameter("local");
		String passwd=request.getParameter("pass");
		String repass=request.getParameter("repass");
		User user=new User();
		user.setName(name);user.setGender(gender);user.setAge(Integer.parseInt(age));
		user.setLocal(local);user.setPasswd(passwd);
		try {
			if(DBUtils.find_name(name))
			{
				request.setAttribute("Msg", "用户名已存在");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			if(DBUtils.regist(user))
			{
				request.setAttribute("Msg","注册成功");
			}else
			{
				request.setAttribute("Msg", "注册失败");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

}
