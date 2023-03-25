<%@page import="productcrudapp.model.Product"%>
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
      <h2 class="text-center mb-4">Update Product</h2>
      <%
      	Product prod = (Product)request.getAttribute("product");
      %>
      
      <%
      	String contextPath = request.getContextPath();
      %>
      <form action="<%= contextPath%>/handle-product" method="post">
        <div class="form-group">
      	  <!-- <label for="product-id">Product Id:</label> -->
      	  <input type="hidden" value ="<%= prod.getId() %>" name="id" class="form-control">
        </div>
        <div class="form-group">
          <label for="product-name">Product Name:</label>
          <input type="text" class="form-control" id="product-name" placeholder="Enter product name" name="name"
          value="<%= prod.getName() %>">
        </div>
        <div class="form-group">
          <label for="product-description">Product Description:</label>
          <textarea class="form-control" id="product-description" placeholder="Enter product description" name="description"><%= prod.getDescription() %>
          </textarea>
        </div>
        <div class="form-group">
          <label for="product-price">Product Price:</label>
          <input type="text" class="form-control" id="product-price" placeholder="Enter product price" name="price"
          value="<%= prod.getPrice() %>">
        </div>
        <div class="container text-center">
        
        <a href="<%=contextPath%>/" class="btn btn-danger">Back</a>
        <button type="submit" class="btn btn-primary">Update</button>
        </div>
      </form>
    </div>
	
</body>
</html>