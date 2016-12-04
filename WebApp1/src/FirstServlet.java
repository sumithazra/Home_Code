

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{  
		  response.setContentType("text/html");  
		  PrintWriter out = response.getWriter();  
		String username=request.getParameter("userName");
		Cookie ck=new Cookie(username, username);
		  out.print("Welcome "+username);  		
		  response.addCookie(ck);
		
		  out.print("<form action='servlet2'>");  
		    out.print("<input type='submit' value='go'>");  
		    out.print("</form>");  
		          
		    out.close();  
	   }
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	

}
