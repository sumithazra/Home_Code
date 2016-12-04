package com.javabrain.test;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;

public class CHibernateUtil {

 static SessionFactory factory;
 
 static{
	 try{
		 
		//creating configuration object  
		Configuration cfg=new Configuration();
		cfg.configure();//populates the data of the configuration file  
		
		//creating seession factory object  
		factory=cfg.buildSessionFactory();
		
		 
	 }
	 catch(Exception e)
	 {
		 e.printStackTrace();
	 }
 } 
 
	public static SessionFactory getSessionFactory()
	{
		return factory;
	}
	
	
}
