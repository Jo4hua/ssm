package db;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangeUServlet
 */
@WebServlet("/ChangeUServlet")
public class ChangeUServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeUServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String btn=request.getParameter("btn");
		String u_name=request.getParameter("u_name");
		int flag=Integer.parseInt(request.getParameter("flag"));
		System.out.println(flag);
		if(btn.equals("提交"))
		{
			System.out.println(btn);
			String power=request.getParameter("power");
			try {
				if(DBUtils.update_power(u_name, Integer.parseInt(power)))
				{
					request.setAttribute("MSG", "修改权限成功");
				}
				else {
					request.setAttribute("MSG", "修改权限失败");
				}
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else
		{
			System.out.println(btn);
			try {
				if(DBUtils.delete_user(u_name))
				{
					request.setAttribute("MSG", "删除成功");
				}else
				{
					request.setAttribute("MSG", "删除失败");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(flag==2)
			request.getRequestDispatcher("AdminServlet?num=1&name=").forward(request, response);
		else
			request.getRequestDispatcher("SearchUser?num=1&name=").forward(request, response);
	}

}
