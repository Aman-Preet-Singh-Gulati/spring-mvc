<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<% String title = (String)request.getAttribute("title"); %>
<%@include file="base.jsp" %>
</head>
<body>

	<div class="container my-5">
      <h2 class="text-center mb-4">Fill the Product Details</h2>
      <form action="handle-product" method="post">
        <div class="form-group">
          <label for="product-name">Product Name:</label>
          <input type="text" class="form-control" id="product-name" placeholder="Enter product name" name="name">
        </div>
        <div class="form-group">
          <label for="product-description">Product Description:</label>
          <textarea class="form-control" id="product-description" placeholder="Enter product description" name="description"></textarea>
        </div>
        <div class="form-group">
          <label for="product-price">Product Price:</label>
          <input type="text" class="form-control" id="product-price" placeholder="Enter product price" name="price">
        </div>
        <div class="container text-center">
        <%
        	String contextPath = request.getContextPath();
        %>
        <a href="<%=contextPath%>/" class="btn btn-danger">Back</a>
        <button type="submit" class="btn btn-primary">Add</button>
        </div>
      </form>
    </div>
	
</body>
</html>