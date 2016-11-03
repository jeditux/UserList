<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Анатолий Гостев
  Date: 23.10.2016
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<h1>Users</h1>
<p>You have updated an User with id ${id} at <%= new java.util.Date() %></p>
<c:url var="mainUrl" value="/users" />
<p>Return to <a href="${mainUrl}">User List</a> </p>
</body>
</html>
