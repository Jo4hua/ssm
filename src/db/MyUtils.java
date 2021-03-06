package db;

import javax.servlet.http.Part;

public class MyUtils {

	public static String getFileName(Part part)
	{
		if(part==null)
			return null;
		String fileName=part.getHeader("content-disposition");
		if(fileName.lastIndexOf("=")+2==fileName.length()-1)
			return null;
		else
			return fileName.substring(fileName.lastIndexOf("=")+2,fileName.length()-1);
	}
}
