package com.servlets;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entities.Note;
import com.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public DeleteServlet() 
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try 
		{
			// After delete button is clicked we fetched 'notes_id' from url, which we have to trim(by mistake if it contains spaces before & after, so it will be removed before saving to not_id variable)
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());

			EntityManager entityManager = FactoryProvider.getFactory().createEntityManager();
			EntityTransaction transaction = entityManager.getTransaction(); 
			Note note = entityManager.find(Note.class, noteId); // here we find note id & store in 'note'
			
			transaction.begin(); // start transaction to make changes in db
 			entityManager.remove(note); // here we delete that object of which id is passed in URL
			transaction.commit(); // complete transaction to make changes in db
			entityManager.close();
			response.sendRedirect("all_notes.jsp"); // redirect to same page after delete a note
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
