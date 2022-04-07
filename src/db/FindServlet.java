package db;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Data;

/**
 * Servlet implementation class FindServlet
 */
@WebServlet("/FindServlet")
public class FindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindServlet() {
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
		String btn=request.getParameter("btn1");
		System.out.println(btn);
			String id=request.getParameter("f_id");
			String name=request.getParameter("f_name");
			String phone=request.getParameter("f_phone");
			String lev=request.getParameter("f_lev");
			Data data=new Data();
			try {
					if(id.equals("")) 
					{
						request.setAttribute("MSG", "插入时，id不能为空");
					} 
					else if(DBUtils.find(id).size()!=0)
					{
						request.setAttribute("MSG", "id已存在，插入失败");
					}
					else 
					{
						data.setId(id);data.setName(name);data.setPhone(phone);data.setLev(lev);
						try {
								if(DBUtils.insert(data))
								{
									request.setAttribute("MSG", "插入成功");
								}
								else
								{
									request.setAttribute("MSG","插入失败");
								}
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		request.getRequestDispatcher("FindAllServlet?num=1&id=").forward(request, response);
	}

}
