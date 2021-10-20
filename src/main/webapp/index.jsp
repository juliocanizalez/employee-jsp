<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="components/header.jsp"/>
  <title>Empleados</title>
</head>
<body>

<jsp:include page="components/style.jsp"/>
<div class="bg-dark">
  <div class="bg-dark container">
    <jsp:include page="components/navbar.jsp">
      <jsp:param name="employee" value="active"/>
    </jsp:include>
  </div>
</div>
<main class="container">

  <%@page import="classes.*, java.util.*" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <div class="row justify-content-around">
    <div class="col-6">
      <h2 class="my-4">Lista de empleados General</h2>

      <%
        List<Employee> lEmpleado = DAO.getAllEmployees();
        request.setAttribute("lEmpleado", lEmpleado);
      %>

      <table class="table table-hover shadow my-4 bg-light">
        <thead>
        <tr>
          <th scope="col" class="text-center">#</th>
          <th scope="col" class="text-center">Apellido</th>
          <th scope="col" class="text-center">Oficio</th>
          <th scope="col" class="text-center">Departamento</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${lEmpleado}" var="e">
          <tr>
            <td class="text-center">${e.employeeNumber}</td>
            <td class="text-center">${e.lastName}</td>
            <td class="text-center">${e.position}</td>
            <td class="text-center">${e.department}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <h2 class="my-4">Lista de empleados por Departamento</h2>
      <div class="row justify-content-between align-items-center">
        <div class="col-5">
          <p>Selecciona un departamento:</p>
        </div>
        <div class="col-6">
          <select class="form-select" id="department"
                  onchange="fetchDepartment()">
            <option selected disabled>Selecciona una opción</option>
            <option value="10">Contabilidad</option>
            <option value="20">Investigaci&oacute;n</option>
            <option value="30">Ventas</option>
            <option value="40">Producci&oacute;n</option>
          </select>
        </div>

      </div>
      <table class="table table-hover shadow my-4 bg-light">
        <thead>
        <tr>
          <th scope="col" class="text-center">#</th>
          <th scope="col" class="text-center">Apellido</th>
          <th scope="col" class="text-center">Oficio</th>
        </tr>
        </thead>
        <tbody id="data">

        </tbody>
      </table>
    </div>
    <div class="col-6">
      <div class="row my-4">
        <div class="col">
          <div class="my-4">
            <div class="card shadow bg-light py-3">
              <div class="card-body">
                <div class="card-title text-center">
                  <%
                    double avgSalary = DAO.getAverageSalary();
                    request.setAttribute("avgSalary", avgSalary);
                  %>
                  <h1 class="text-success">
                    <c:out value="$${avgSalary}"/>
                  </h1>
                  <p class="card-text text-center">
                    Salario medio
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <%
          DepartmentEmployee conta = DAO.getQuantityAndAverage(10);
          request.setAttribute("conta", conta);
        %>
        <div class="col-6">
          <div class="my-2">
            <div class="card shadow py-3 bg-light">
              <div class="card-body">
                <div class="card-title text-center">
                  <%
                    double minSalary = DAO.getMinimunSalary();
                    request.setAttribute("minSalary", minSalary);
                  %>
                  <h1 class="text-success">
                    <c:out value="$${minSalary}"/>
                  </h1>
                  <p class="card-text text-center">
                    Salario menor
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="my-2">
            <div class="card shadow py-3 bg-light">
              <div class="card-body">
                <div class="card-title text-center">
                  <h1 class="text-primary">
                    <c:out value="${conta.quantity}"/>
                  </h1>
                  <p class="card-text text-center">
                    Cantidad Empleados Contabilidad
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="my-2">
            <div class="card shadow py-3 bg-light">
              <div class="card-body">
                <div class="card-title text-center">
                  <%
                    DepartmentEmployee inves = DAO.getQuantityAndAverage(20);
                    request.setAttribute("inves", inves);
                  %>
                  <h1 class="text-success">
                    <c:out value="$${inves.avgSalary}"/>
                  </h1>
                  <p class="card-text text-center">
                    Salario promedio departamento de Investigaci&oacute;n
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="my-2">
            <div class="card shadow py-3 bg-light">
              <div class="card-body">
                <div class="card-title text-center">
                  <%
                    DepartmentEmployee ventas = DAO.getQuantityAndAverage(30);
                    request.setAttribute("ventas", ventas);
                  %>
                  <h1 class="text-success">
                    <c:out value="$${ventas.avgSalary}"/>
                  </h1>
                  <p class="card-text text-center">
                    Salario promedio Ventas
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="my-2">
            <div class="card shadow py-3 bg-light">
              <div class="card-body">
                <div class="card-title text-center">
                  <%
                    DepartmentEmployee prod = DAO.getQuantityAndAverage(40);
                    request.setAttribute("prod", prod);
                  %>
                  <h1 class="text-success">
                    <c:out value="$${prod.avgSalary}"/>
                  </h1>
                  <p class="card-text text-center">
                    Salario promedio departamento de Producci&oacute;n
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-6">
          <div class="my-2">
            <div class="card shadow py-3 bg-light">
              <div class="card-body">
                <div class="card-title text-center">
                  <%
                    double maxSalary = DAO.getMaxSalary();
                    request.setAttribute("maxSalary", maxSalary);
                  %>
                  <h1 class="text-success">
                    <c:out value="$${maxSalary}"/>
                  </h1>
                  <p class="card-text text-center">
                    Salario mayor
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="my-2">
            <div class="card shadow py-3 bg-light">
              <div class="card-body">
                <div class="card-title text-center">
                  <h1 class="text-success">
                    <c:out value="$${conta.avgSalary}"/>
                  </h1>
                  <p class="card-text text-center">
                    Salario promedio departamento de Contabilidad
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="my-2">
            <div class="card shadow py-3 bg-light">
              <div class="card-body">
                <div class="card-title text-center">
                  <h1 class="text-primary">
                    <c:out value="${inves.quantity}"/>
                  </h1>
                  <p class="card-text text-center">
                    Cantidad Empleados Investigacion
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="my-2">
            <div class="card shadow py-3 bg-light">
              <div class="card-body">
                <div class="card-title text-center">
                  <h1 class="text-primary">
                    <c:out value="${ventas.quantity}"/>
                  </h1>
                  <p class="card-text text-center">
                    Cantidad Empleados ventas
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="my-2">
            <div class="card shadow py-3 bg-light">
              <div class="card-body">
                <div class="card-title text-center">
                  <h1 class="text-primary">
                    <c:out value="${prod.quantity}"/>
                  </h1>
                  <p class="card-text text-center">
                    Cantidad Empleados Produccion
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<jsp:include page="components/footer.jsp"/>
</body>
</html>