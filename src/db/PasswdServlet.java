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
 * Servlet implementation class PasswdServlet
 */
@WebServlet("/PasswdServlet")
public class PasswdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswdServlet() {
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
		String old=request.getParameter("old");
		String np=request.getParameter("new");
		User user=(User)request.getSession().getAttribute("user");
		if(old.equals(user.getPasswd()))
		{
		try {
			boolean flag=DBUtils.change_pw(user.getName(), np);
			if(flag)
			{
				request.setAttribute("Msg", "修改成功");
				user.setPasswd(np);
			}else
			{
				request.setAttribute("Msg", "修改失败");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}else
		{
			request.setAttribute("Msg", "密码错误");
		}
		request.getRequestDispatcher("change_pw.jsp").forward(request, response);
	}

}
