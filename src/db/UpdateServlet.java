package db;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Data;

/**
 * Servlet implementation class UpdateServlrt
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String btn=request.getParameter("btn");
		String id=request.getParameter("id");
		System.out.println(btn);
		if(btn.equals("修改"))
		{
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String lev=request.getParameter("lev");
			Data data=new Data();
			data.setId(id);data.setName(name);data.setLev(lev);data.setPhone(phone);
			try {
				if(DBUtils.update(data))
				{
					request.setAttribute("MSG","修改成功");
				}
				else
				{
					request.setAttribute("MSG", "修改失败");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("FindAllServlet?num=1&id=").forward(request, response);
		}
		else
		{
			try {
				if(DBUtils.delete(id))
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
			request.getRequestDispatcher("FindAllServlet?num=1&id=").forward(request, response);
		}
	}

}
