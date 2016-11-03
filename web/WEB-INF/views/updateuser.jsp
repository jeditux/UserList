<%--
  Created by IntelliJ IDEA.
  User: Анатолий Гостев
  Date: 23.10.2016
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <c:url var="jquery_url" value="/resources/scripts/jquery-3.1.1.min.js" />
  <c:url var="jquery_ui_url" value="/resources/scripts/jquery-ui.min.js" />
  <c:url var="jquery_ui_theme_css" value="/resources/styles/jquery-ui.theme.css" />
  <link rel="stylesheet" type="text/css" media="screen" href="${jquery_ui_theme_css}" />
  <script src="${jquery_url}" type="text/javascript"><jsp:text /></script>
  <script src="${jquery_ui_url}" type="text/javascript"><jsp:text /></script>
  <title></title>
</head>
<body>
<h1>Update User</h1>
<c:url var="saveUrl" value="/users/edit.form?id=${userAttribute.id}" />
<form:form modelAttribute="userAttribute" method="post" action="${saveUrl}">
  <table>
    <tr>
      <td><form:label path="name">Name:</form:label></td>
      <td><form:input path="name" /></td>
    </tr>
    <tr>
      <td><form:label path="age">Age:</form:label></td>
      <td><form:input path="age" /></td>
    </tr>
    <tr>
      <td><form:checkbox path="admin" /></td>
    </tr>
    <tr>
      <td><form:label path="createdDate">Created Date:</form:label></td>
      <td><form:input path="createdDate" /></td>
    </tr>
  </table>
  <input type="submit" value="Save" />
</form:form>
</body>
</html>
