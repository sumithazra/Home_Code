/**@author:sumit
 * @date:16-10-2013
 * @implementation_of_changer_equest:CR001
 * @description:It is controller servlet class for new customer registration.
 *
 */

package controller;


import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewAccountBean;
import dao.NewAccountBL;


public class CustomerRegistration extends HttpServlet {
	/** It's a POJO file.
	 * 	enables to store all form data in java object localy
	 */
	private static final long serialVersionUID = 1L;
	NewAccountBean ob;
    public CustomerRegistration() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	/**accept all form value.
	 * pass to bean.
	 * calls business logic to fulfill the request i.e. to insert all value in database..
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter out=response.getWriter();

		ob=new NewAccountBean();
		String acc_type2=request.getParameter("r1");

		/**
		 * All setter method is used to set value in POJO.
		 */
		ob.setAcc_type2(acc_type2);

	    String fname2=request.getParameter("fname");
	    ob.setFname2(fname2);

	    String mname2=request.getParameter("mname");
	    ob.setMname2(mname2);

	    String lname2=request.getParameter("lname");
	    ob.setLname2(lname2);

	    String dob=request.getParameter("dob");
		String[] dob1 = dob.split("-");
		String dob2=dob1[2]+"-"+dob1[1]+"-"+dob1[0];
		ob.setDob(dob2);

		String sex2=request.getParameter("r2");
		ob.setSex2(sex2);

		String marital_stat2=request.getParameter("r3");
		ob.setMarital_stat2(marital_stat2);

		String email2=request.getParameter("email");
		ob.setEmail2(email2);

		String occ=request.getParameter("occupation");
		ob.setOcc(occ);

		String address2=request.getParameter("add1");
		ob.setAddress2(address2);

		String city2=request.getParameter("city1");
		ob.setCity2(city2);

		String state2=request.getParameter("state1");
		ob.setState2(state2);

		String country2=request.getParameter("country1");
		ob.setCountry2(country2);

		int zipcode2=Integer.parseInt(request.getParameter("zip1"));
		ob.setZipcode2(zipcode2);

		String landline2=request.getParameter("landline");
		ob.setLandline2(landline2);

		String mobile2=request.getParameter("mobile");
		ob.setMobile2(mobile2);

		NewAccountBL obj=new NewAccountBL();
		if(obj.insert(ob)>0)
		response.sendRedirect("redirect.jsp");
		else
			out.println("Failure....");
		}
	}
