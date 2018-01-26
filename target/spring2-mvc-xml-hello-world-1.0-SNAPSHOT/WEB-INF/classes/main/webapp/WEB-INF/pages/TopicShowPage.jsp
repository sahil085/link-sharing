<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/22/2017
  Time: 2:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="errorpage.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="res" items="${Resources}">
    <b>Topic Name : </b>
    <b>T</b>

</c:forEach>
</body>
</html>
