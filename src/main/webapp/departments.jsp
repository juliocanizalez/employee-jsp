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
<jsp:include page="components/style.jsp" />

<div class="bg-dark">
  <div class="bg-dark container">
    <jsp:include page="components/navbar.jsp">
      <jsp:param name="department" value="active"/>
    </jsp:include>
  </div>
</div>
<main class="container">
  <%@page import="classes.*, classes.DAO, java.util.*" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <div class="row justify-content-between">
    <div class="col-6">
      <h2 class="my-4">Departamentos</h2>
      <%
        List<Department> lDepartamento = DAO.getDepartmentList();
        request.setAttribute("lDepartamento", lDepartamento);
      %>
      <table class="table table-hover shadow my-4">
        <thead>
        <tr>
          <th scope="col" class="text-center">#</th>
          <th scope="col" class="text-center">Nombre</th>
          <th scope="col" class="text-center">Localidad</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${lDepartamento}" var="e">
          <tr>
            <td class="text-center">${e.departmentNumber}</td>
            <td class="text-center">${e.departmentName}</td>
            <td class="text-center">${e.location}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
    <div class="col-5">
      <div class="p-4 shadow my-4">
        <h2>Agregar Departamento</h2>
        <form method="POST" onsubmit="saveDepartment()" >
          <div class="mb-3">
            <label for="departmentNumber" class="form-label"># de departamento</label>
            <input type="text" class="form-control" name="departmentNumber" id="departmentNumber"  autocomplete="off" required />
          </div>
          <div class="mb-3">
            <label for="departmentName" class="form-label">Nombre de departamento</label>
            <input type="text" class="form-control" name="departmentName" id="departmentName"  autocomplete="off" required/>
          </div>
          <div class="mb-3">
            <label for="location" class="form-label">Localidad</label>
            <input type="text" class="form-control" name="location" id="location"  autocomplete="off" required/>
          </div>
          <div class="mb-3 text-center">
            <button class="btn btn-primary" type="submit">Guardar</button>
          </div>
        </form>
      </div>
    </div>
  </div>

</main>
</body>
</html>
