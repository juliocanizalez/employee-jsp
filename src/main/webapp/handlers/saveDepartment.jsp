<%--
  Created by IntelliJ IDEA.
  User: julio
  Date: 20/10/21
  Time: 07:54
  To change this template use File | Settings | File Templates.
--%>
<%@page import="classes.DAO, classes.Department" %>
<%
  if (request.getParameter("departmentNumber") != null && request.getParameter("departmentNumber") != null && request.getParameter("location") != null) {
    Department dep = new Department();
    dep.setDepartmentNumber(Integer.parseInt(request.getParameter("departmentNumber")));
    dep.setDepartmentName(request.getParameter("departmentName"));
    dep.setLocation(request.getParameter("location"));
    DAO.saveDepartment(dep);
  }
%>