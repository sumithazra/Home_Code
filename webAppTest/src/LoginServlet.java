

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UVarification;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
       
    }

	

	protected void service(HttpServletRequest req, HttpServletResponse rep)
			throws ServletException, IOException {
		
		System.out.println(req.getAuthType());
		System.out.println(req.getContentLength());
		System.out.println(req.getContentType());
		System.out.println(req.getLocalAddr());
		System.out.println(req.getLocalName());
		System.out.println(req.getLocalPort());
		System.out.println(req.getMethod());
		String userName = req.getParameter("usi");
		String passWord = req.getParameter("pwd");
		System.out.println();
		System.out.println(userName);
		System.out.println(passWord);
		String msg = "";

		Writer out = rep.getWriter(); 

		UVarification uv = new UVarification();

		if (uv.getvarified(userName, passWord)) {

			msg = "<h1> Weclome  "+  "<br> Login Successful";

		} else {
			msg = "<h1>Login failed . Try agin";
		}

		out.write(msg);

	}

}
