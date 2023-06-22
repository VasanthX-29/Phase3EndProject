<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.example.controller.*" %>
     <%@ page import="com.example.dao.*" %>
      <%@ page import="com.example.entity.*" %>
       <%@ page import="com.example.service.*" %>
        <%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
          <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Citizen</title>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
        max-width: 500px;
        margin: 0 auto;
    }

    table td {
        padding: 8px;
        border: 1px solid #ddd;
    }

    table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

   
</style>
</head>
<body>

   <div align="center">
       <h1>VIEW A CITIZEN</h1></br></br>
   
  
       <%Optional<Citizen> citizen=(Optional<Citizen>)request.getAttribute("citizenToBeViewed");
         Citizen c = citizen.orElse(null);
         %>
      <table>
      
        <tr><td>ID</td><td><%=c.getId() %></td></tr>
         <tr><td>NAME</td><td><%=c.getName() %></td></tr>
          <tr><td>CITY</td><td><%=c.getCity() %></td></tr>
           <tr><td>NO OF DOSES</td><td><%=c.getDoseCount() %></td></tr>
            <tr><td>VACCINATION STATUS</td><td><%=c.getVaccinationStatus() %></td></tr>
             <tr><td>VACCINATION CENTER NAME</td><td><%=c.getVc().getName() %></td></tr>
      
      </table></br></br>
      
      <a href="/citizens">Go Back</a>
      
       </div>


</body>
</html>