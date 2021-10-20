<%--
  Created by IntelliJ IDEA.
  User: julio
  Date: 20/10/21
  Time: 00:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="classes.*, java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  if (request.getParameter("departmentId") != null) {
    int deparmentId = Integer.parseInt(request.getParameter("departmentId"));
    List<Employee> employeesList = DAO.getEmployeesByDepartment(deparmentId);
    request.setAttribute("employeesList", employeesList);
%>
<c:forEach items="${employeesList}" var="e">
  <tr>
    <td class="text-center">${e.employeeNumber}</td>
    <td class="text-center">${e.lastName}</td>
    <td class="text-center">${e.position}</td>
  </tr>
</c:forEach>

<%
  }
%>