package com.helper;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

//import org.hibernate.SessionFactory;
//import org.hibernate.cfg.Configuration;

public class FactoryProvider 
{

//	public static SessionFactory factory; DELETE LATER
	public static EntityManagerFactory factory;
	
//	public static SessionFactory getFactory() DELETE LATER
	public static EntityManagerFactory getFactory() 
	{		
		if (factory == null) {
//DELETE LATER			factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			factory = Persistence.createEntityManagerFactory("flash");
		}

		return factory;
	}

	public void closeFactory() 
	{
		if (factory.isOpen()) 
		{
			factory.close();
		}
	}
}
