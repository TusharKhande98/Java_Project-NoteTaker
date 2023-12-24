<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.helper.*,org.hibernate.*,com.entities.*,javax.persistence.EntityTransaction, javax.persistence.EntityManager"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Update Note</title>
	<!-- all CDN link & local CSS, JS file are imported here -->	
	<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<!-- import navbar here to display -->		
		<%@include file="navbar.jsp"%>
		<h1>Edit your note</h1>
		<br>

		<!--  After update button is clicked we fetched 'note_id' from url, which we have to trim(by mistake if it contains spaces before & after, so it will be removed before saving to note_id variable) -->
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			EntityManager entityManager = FactoryProvider.getFactory().createEntityManager();
			EntityTransaction transaction = entityManager.getTransaction(); 
			Note note = entityManager.find(Note.class, noteId); // here we find note id & store in 'note'
		%>

		<form action="UpdateServlet" method="post">

			<!-- To fetch id we create this field, but applied hidden property here so its not visible -->
			<input value="<%=note.getId()%>" name="noteId" type="hidden" />

			<div class="form-group">
				<label for="title">Note title</label> <input name="title" required
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here"
					value="<%=note.getTitle()%>" />
		<!-- Using value attribute, we will set current Id here on which update operation is get performed -->
		<!-- By this we get values in window of title & note which is wrote previously -->
			</div>


			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" required id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px;"><%=note.getContent()%>
					</textarea>
			<!-- same as above we use value attribute here -->
			</div>

			<div class="container text-center">

				<button type="submit" class="btn btn-success">Save your
					note</button>
			</div>

		</form>

	</div>
</body>
</html>