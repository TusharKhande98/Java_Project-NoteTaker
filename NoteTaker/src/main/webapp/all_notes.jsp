<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query, javax.persistence.EntityManagerFactory, javax.persistence.EntityManager, javax.persistence.Persistence, javax.persistence.TypedQuery"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>All notes: Note Taker</title>
	<!-- all CDN link & local CSS, JS file are imported here -->
	<%@include file="all_js_css.jsp"%>
	</head>
<body>

	<div class="container">
		<!-- import navbar here to display -->	
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes:</h1>

0		<div class="row">
			<div class="col-12">

			<!-- Start of scriptlet tag-1 in which we write java logic processing code -->			
				<%
				// Here we call method from fcatoryprovide class
				EntityManager entityManager = FactoryProvider.getFactory().createEntityManager();

				// Here we write 'TypedQuery' which is a interface of JPA
				String queryString = "SELECT n FROM Note n"; // here we create a query of JPQ which is little different from SQL
				TypedQuery<Note> query = entityManager.createQuery(queryString, Note.class); // Here we stored query in that interface type of variable(query will be crreated uing method which is available in entity manager)
				List<Note> list = query.getResultList(); // Here we will get list of notes which will be stored in Note type of List's Object
				
				for (Note note : list)  // we have collection of list, s to iterate apply foreach loop(all content from list will be iterate with variable 'note')
				{
				%>
			<!-- End of scriptlet tag-1 in which we write java logic processing code -->

			<!-- Loop between this scriptlet tag 1 and 2 applied to print list content 1 by 1 after iterating all -->
				<div class="card mt-3" >
					<img class="card-img-top m-4 mx-auto" style="max-width:100px;" src="img/notepad.png" alt="Card image cap">
					<div class="card-body px-5">
						<!-- Below using 'Expression tag' we had print 'Note Title' using get method from object 'note'-->
						<h5 class="card-title"><%= note.getTitle()%></h5>
						<p class="card-text">
						<!-- Here we print notes content using Expression tag below -->
						<%= note.getContent() %>
						</p>
						<!-- Below we add date of note submission using Expression tag-->
						<p><b class="text-primary"><%= note.getAddedDate()  %></b></p>
						<div class="container text-center mt-2">

						<!-- Using URL rewriting we send 'note_id' vairable in which we stored note id(using Expression tag) so we can fetch id on 'Delete Servlet' -->
						<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
						<!-- Using URL rewriting we send 'note_id' vairable in which we stored note id(using Expression tag) so we can fetch id on 'Update Servlet' -->
						<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>

			<!-- Start of scriptlet tag-2 in which we write java logic processing code -->			
				<%
					}	
			// Loop to iterate list has been end here	
				entityManager.close();
				%>
			<!-- End of scriptlet tag-2 in which we write java logic processing code -->			
			</div>
		</div>
	</div>
</body>
</html>