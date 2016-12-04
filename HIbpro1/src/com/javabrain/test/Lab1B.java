package com.javabrain.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class Lab1B {

	
	public static void main(String[] args) {
		Transaction tx=null;
		try{
			
			SessionFactory sf=CHibernateUtil.getSessionFactory();
			Session session=sf.openSession();
			tx=session.beginTransaction();
			
			Customer cust=(Customer)session.load(Customer.class,1);
			System.out.println(cust.getC_name()+"\t"+cust.getC_email()+"\t");
			
			tx.commit();
			session.close();
			
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
