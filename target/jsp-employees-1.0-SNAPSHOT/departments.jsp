<%--
  Created by IntelliJ IDEA.
  User: julio
  Date: 19/10/21
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="components/header.jsp" />
  <title>Departamentos</title>
</head>
<body>
  <jsp:include page="components/navbar.jsp">
    <jsp:param name="department" value="active"/>
  </jsp:include>
  <jsp:include page="components/style.jsp" />
</body>
</html>
