package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entities.Note;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() 
	{
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		try 
		{
			// title,content fetch
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Note note = new Note(title, content, new Date());
//			System.out.println(note.getId() + " : " + note.getTitle()); // print for demo checking purpose

//------------ DELETE LATER --------------------------------------------------------------
//			EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("flash");
//			EntityManager entityManager = entityManagerFactory.createEntityManager();			
//--------------------------------------------------------------------------
			EntityManager entityManager = FactoryProvider.getFactory().createEntityManager();
			EntityTransaction entityTransaction = entityManager.getTransaction();

			entityTransaction.begin();
			entityManager.persist(note);
			entityTransaction.commit();

			entityManager.close();

			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<h1 style='text-align:center;'>Note is added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>Click to view all notes</a></h1>");

		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
