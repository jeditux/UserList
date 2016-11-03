<%--
  Created by IntelliJ IDEA.
  User: Анатолий Гостев
  Date: 23.10.2016
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<h1>Users</h1>
<p>You have added a new User at <%= new java.util.Date() %></p>
<c:url var="mainUrl" value="/users" />
<p>Return to <a href="${mainUrl}">User List</a> </p>
</body>
</html>
