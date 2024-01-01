package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.entities.Note;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public UpdateServlet() 
	{
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		try 
		{
			// fetch Title, Content by  its parameter to set new info in it.
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());

			EntityManager entityManager = FactoryProvider.getFactory().createEntityManager();
			EntityTransaction transaction = entityManager.getTransaction(); 
			transaction.begin();
			Note note = entityManager.find(Note.class, noteId); // here we find note id & store in 'note'

			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());

			transaction.commit(); // complete transaction to make changes in db
			entityManager.close();
			response.sendRedirect("all_notes.jsp");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
