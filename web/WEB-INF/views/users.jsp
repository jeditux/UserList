<%--
  Created by IntelliJ IDEA.
  User: Анатолий Гостев
  Date: 22.10.2016
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <c:url var="jquery_url" value="/resources/scripts/jquery-3.1.1.min.js" />
  <c:url var="jquery_ui_url" value="/resources/scripts/jquery-ui.min.js" />
  <c:url var="jquery_ui_theme_css" value="/resources/styles/jquery-ui.theme.css" />
  <c:url var="jqgrid_css" value="/resources/styles/ui.jqgrid.css" />
  <c:url var="jqgrid_searchFilter_css" value="/resources/styles/searchFilter.css" />
  <c:url var="jqgrid_locale_url" value="/resources/scripts/grid.locale-en.js" />
  <c:url var="jqgrid_url" value="/resources/scripts/jquery.jqGrid.min.js" />
  <c:url var="searchFilter" value="/resources/scripts/jquery.searchFilter.js" />
  <link rel="stylesheet" type="text/css" media="screen" href="${jquery_ui_theme_css}" />
  <link rel="stylesheet" type="text/css" media="screen" href="${jqgrid_css}" />
  <link rel="stylesheet" type="text/css" media="screen" href="${jqgrid_searchFilter_css}" />
  <script type="text/javascript" src="${jquery_url}"><jsp:text /></script>
  <script src="http://code.jquery.com/jquery-migrate-1.0.0.js"></script>
  <script type="text/javascript" src="${jquery_ui_url}"><jsp:text /></script>
  <script type="text/javascript" src="${jqgrid_locale_url}"><jsp:text /></script>
  <script type="text/javascript" src="${jqgrid_url}"><jsp:text /></script>
  <script type="text/javascript" src="${searchFilter}"><jsp:text /></script>

  <style>
    .ui-jqgrid .ui-pg-input {height:20px;}
    .ui-jqgrid .ui-jqgrid-pager {height: 40px;}
    .ui-jqgrid .ui-jqgrid-pager .ui-pg-div {font-size:14px;}
  </style>
  <title>UserList</title>
</head>
<body>
  <h1>Users</h1>
  <%--
  <form:form action="/users" method="get">
    <table>
      <tr>
        <td><label>Name:</label></td>
        <td><input type="text" name="search" /></td>
        <td>
          <button type="submit" class="ui-button ui-state-default ui-corner-all ui-button-text-only">
          <span class="ui-button-text">Search</span>
          </button>
        </td>
      </tr>
    </table>
  </form:form>
  --%>
  <c:url var="addUrl" value="/users/add.form" />
  <p><a href="${addUrl}">Add new user</a></p>
  <%--
  <table style="border: 1px solid; width: 500px; text-align: center">
    <thead style="background: #ccf">
      <tr>
        <th>Name</th>
        <th>Age</th>
        <th>Admin</th>
        <th>Created Date</th>
        <th colspan="3"></th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${users}" var="user">
        <c:url var="editUrl" value="/users/edit.form?id=${user.id}" />
        <c:url var="deleteUrl" value="/users/delete.form?id=${user.id}" />
        <tr>
          <td><c:out value="${user.name}" /></td>
          <td><c:out value="${user.age}" /></td>
          <td><c:out value="${user.admin}" /></td>
          <td><c:out value="${user.createdDate}" /></td>
          <td><a href="${editUrl}">Edit</a> </td>
          <td><a href="${deleteUrl}">Delete</a> </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <c:if test="${empty users}">
    There are no users in the list.
  </c:if>
  --%>
  <div>
    <table id="list"><tr><td /></tr></table>
  </div>
  <div id="pager"></div>

  <script type="text/javascript">

    $(function() {
      $('#list').jqGrid({
        url: "/users/grid.form",
        datatype: 'json',
        mtype: 'GET',
        colNames:['Name', 'Age', 'Admin', 'Created Date'],
        colModel: [
          { name: 'name', index: 'name', width: 150, editable: true, edittype: 'text' },
          { name: 'age', index: 'age', width: 150, editable: true, edittype: 'text', search: false },
          { name: 'admin', index: 'isAdmin', width: 150, editable: true, edittype: 'checkbox', search: false },
          { name: 'createdDate', index: 'createdDate', width: 150, editable: true, edittype: 'text', search: false }
        ],
        jsonReader : {
          root : "userData",
          page : "currentPage",
          total : "totalPages",
          records : "totalRecords",
          repeatitems : false,
          id : "id"
        },
        pager : '#pager',
        rowNum : 10,
        rowList : [10, 20, 30],
        sortname : 'name',
        sortorder : 'asc',
        viewrecords : true,
        gridview : true,
        height : 250,
        width : 500,
        caption : 'User List'
      });
      $('#list').jqGrid('navGrid','#pager', {
        add: false,
        del: true,
        edit: true,
        search: false,
        addtext: "Add",
        deltext: "Delete",
        edittext: "Edit"
      },
      {
        url: '/users/edit.form',
        mtype: 'post',
        height: 250,
        width: 400,
        closeAfterEdit: true,
        reloadAfterSubmit: true,
        drag: true
      },
      {
        url: '/users/add.form',
        mtype: 'post',
        height: 250,
        width: 400,
        closeAfterAdd: true,
        reloadAfterSubmit: true,
        drag: true
      },
      {
        url: '/users/delete.form',
        mtype: 'get',
        height: 250,
        width: 400,
        reloadAfterSubmit: true,
        drag: true
      });
      $('#list').jqGrid('filterToolbar', {});
    });

  </script>

</body>
</html>
