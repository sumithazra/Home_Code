package com.javabrain.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Lab1 {

	public static void main(String[] args) {
		Transaction t=null;
		try{
		
			
			
			SessionFactory factory=CHibernateUtil.getSessionFactory();

		   //creating session object  
		   Session session=factory.openSession();  

		   //creating transaction object  
		   t=session.beginTransaction();  

     Customer cus=new Customer();
     cus.setC_name("nagambika");
     cus.setC_email("mama123@gmail.com");
     cus.setC_phone(7677878);
     
     session.save(cus);
     t.commit();
     
     session.close();  
     
     System.out.println("successfully saved");  
     
		}
		
		
		catch(Exception ex)
		{
			
			if(t!=null)
				t.rollback();
			
			
		}




	}


}
