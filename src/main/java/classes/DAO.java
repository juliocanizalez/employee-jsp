package classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAO {
  private static final String DB_HOST = "jdbc:mysql://localhost:3306/lab1per2";
  private static final String DB_USER = "develop";
  private static final String DB_PASS = "develop";

  public static Connection getConnection(){
    Connection connection = null;
    try{
      Class.forName("com.mysql.jdbc.Driver");
      connection = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASS);
    }catch (ClassNotFoundException | SQLException e){
      System.out.println(e.getMessage());
    }
    return connection;
  }

  public static int saveDepartment(Department dep) {
    int status = 0;
    Connection oConnection;
    PreparedStatement pStatement;

    try {
      oConnection = getConnection();
      pStatement = oConnection.prepareStatement("CALL agregarDepartamento(?,?,?)");
      pStatement.setInt(1, dep.getDepartmentNumber());
      pStatement.setString(2, dep.getDepartmentName());
      pStatement.setString(3, dep.getLocation());

      status = pStatement.executeUpdate();
    } catch (SQLException e) {
      System.out.println(e.getMessage());
    }

    return status;
  }

  public static List<Employee> getAllEmployees() {
    List<Employee> employeesList = new ArrayList<>();
    Connection oConnection;
    PreparedStatement pStatement;
    ResultSet oResult;

    try {
      oConnection = getConnection();
      pStatement = oConnection.prepareStatement("SELECT *  FROM vistaEmpleados");
      oResult = pStatement.executeQuery();
      while (oResult.next()) {
        Employee e = new Employee();
        e.setEmployeeNumber(oResult.getInt("emp_no"));
        e.setLastName(oResult.getString("apellido"));
        e.setPosition(oResult.getString("oficio"));
        e.setDepartment(oResult.getString("dnombre"));

        employeesList.add(e);
      }
    } catch (SQLException e) {
      System.out.println(e.getMessage());
    }

    return employeesList;
  }

  public static List<Employee> getEmployeesByDepartment(int departmentNumber) {
    List<Employee> employeesList = new ArrayList<>();
    Connection oConnection;
    PreparedStatement pStatement;
    ResultSet oResult;

    try {
      oConnection = getConnection();
      pStatement = oConnection.prepareStatement("CALL filtrarEmpleadosDepto(?)");
      pStatement.setInt(1, departmentNumber);
      oResult = pStatement.executeQuery();
      while (oResult.next()) {
        Employee e = new Employee();
        e.setEmployeeNumber(oResult.getInt("emp_no"));
        e.setLastName(oResult.getString("apellido"));
        e.setPosition(oResult.getString("oficio"));

        employeesList.add(e);
      }
    } catch (SQLException e) {
      System.out.println(e.getMessage());
    }

    return employeesList;
  }


  public static double getAverageSalary() {
    double avgSalary = 0;
    Connection oConnection;
    PreparedStatement pStatement;
    ResultSet oResult;

    try {
      oConnection = getConnection();
      pStatement = oConnection.prepareStatement("SELECT * FROM vpromedio");
      oResult = pStatement.executeQuery();
      while (oResult.next()) {
        avgSalary = oResult.getDouble("promedio_salario");
      }
    } catch (SQLException e) {
      System.out.println(e.getMessage());
    }

    return avgSalary;
  }


  public static double getMinimunSalary() {
    double minimumSalary = 0;
    Connection oConnection;
    PreparedStatement pStatement;
    ResultSet oResult;

    try {
      oConnection = getConnection();
      pStatement = oConnection.prepareStatement("SELECT * FROM vistaSalarioMenor");
      oResult = pStatement.executeQuery();
      while (oResult.next()) {
        minimumSalary = oResult.getDouble("salario_menor");
      }
    } catch (SQLException e) {
      System.out.println(e.getMessage());
    }

    return minimumSalary;
  }


  public static double getMaxSalary() {
    double maxSalary = 0;
    Connection oConnection;
    PreparedStatement pStatement;
    ResultSet oResult;

    try {
      oConnection = getConnection();
      pStatement = oConnection.prepareStatement("SELECT * FROM vistaSalarioMayor");
      oResult = pStatement.executeQuery();
      while (oResult.next()) {
        maxSalary = oResult.getDouble("salario_mayor");
      }
    } catch (SQLException e) {
      System.out.println(e);
    }

    return maxSalary;
  }


  public static DepartmentEmployee getQuantityAndAverage(int departmentNumber) {
    DepartmentEmployee oData = new DepartmentEmployee();
    Connection oConnection;
    PreparedStatement pStatement;
    ResultSet oResult;

    try {
      oConnection = getConnection();
      pStatement = oConnection.prepareStatement("CALL cantidadEmpleadoDepto(?)");
      pStatement.setInt(1, departmentNumber);
      oResult = pStatement.executeQuery();
      while (oResult.next()) {
        oData.setAvgSalary(oResult.getDouble("promedio_salario"));
        oData.setQuantity(oResult.getInt("cantidad_empleados"));
      }
    } catch (SQLException e) {
      System.out.println(e.getMessage());
    }

    return oData;
  }

  public static List<Department> getDepartmentList() {
    List<Department> departmentList = new ArrayList<>();
    Connection oConnection;
    PreparedStatement pStatement;
    ResultSet oResult;

    try {
      oConnection = getConnection();
      pStatement = oConnection.prepareStatement("SELECT * FROM departamento");
      oResult = pStatement.executeQuery();
      while (oResult.next()) {
        Department d = new Department();
        d.setDepartmentNumber(oResult.getInt("dept_no"));
        d.setDepartmentName(oResult.getString("dnombre"));
        d.setLocation(oResult.getString("loc"));

        departmentList.add(d);
      }
    } catch (SQLException e) {
      System.out.println(e.getMessage());
    }

    return departmentList;
  }
}
