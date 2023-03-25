<%@page import="java.util.List"%>
<%@page import="productcrudapp.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<% String title = (String)request.getAttribute("title"); %>
	<%@include file="base.jsp" %>
	
</head>
<body>
	
	<div class="container mt-3">
		<div class="row">
				
			<div class="col-md-12">
				<h1 class="text-center mb-3 mt-3">Welcome to Product App</h1>
				
				<table class="table mt-4">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">ID</th>
				      <th scope="col">Product Name</th>
				      <th scope="col">Product Description</th>
				      <th scope="col">Product Price</th>
				      <th scope="col">Action</th>
				    </tr>
				  </thead>
				  <tbody>
				  
				  	<%
				  	List<Product> productList = (List<Product>)request.getAttribute("products");
					%>
					<%
					for (Product product : productList) { %>
				    <tr>
				      <th scope="row"><%= product.getId() %></th>
				      <td><%= product.getName() %></td>
				      <td><%= product.getDescription() %></td>
				      <td class="font-weight-bold">&#x20B9;<%= product.getPrice() %></td>
				      <td>
				      	<a href="delete-product/<%= product.getId() %>"><i class="fa-solid fa-trash-can text-danger" style="font-size: 25px;"></i></a>
				      	<a href="update-product/<%= product.getId() %>"><i class="fa-solid fa-pen-nib text-primary" style="font-size: 25px;"></i></a>
				      </td>
				    </tr>
					<% } %>
				   </tbody>
				</table>
				
				<div class="container text-center">
						
					<a href="add-product" class="btn btn-outline-success">Add Product</a>	
					
				</div>
				
			</div>
			
		</div>
	</div>
	
</body>
</html>
