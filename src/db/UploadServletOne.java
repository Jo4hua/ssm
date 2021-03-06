package db;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import database.User;

/**
 * Servlet implementation class UploadServletOne
 */
@WebServlet("/UploadServletOne")
@MultipartConfig()
public class UploadServletOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServletOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		request.setCharacterEncoding("UTF-8");
		Part part =request.getPart("part");
		File Dir=new File(this.getServletContext().getRealPath("/temp/header"));
		User user=(User)request.getSession().getAttribute("user");
		if(Dir!=null)
		{
			Dir.mkdir();
		}
		String name=MyUtils.getFileName(part);
		if(name!=null)
		{
			part.write(Dir+File.separator+name);
			user.setPath("temp/header/"+name);
			try {
				if(DBUtils.updateP("temp/header/"+name, user.getName()))
				{
					request.setAttribute("Msg","头像上传成功");
				}else {
					request.setAttribute("Msg", "头像上传失败");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("personal.jsp").forward(request, response);
		}
	}

}
