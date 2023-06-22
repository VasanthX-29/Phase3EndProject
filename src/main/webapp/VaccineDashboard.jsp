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
<title>Vaccine Dashboard</title>
<style>
       a {
        text-decoration: none;
    }
      a:hover
      {
         text-decoration:underline;
         color:#000000;
      }
        table {
            border-collapse: collapse;
            width: 50%;
        }
        
        th, td {
            text-align: center;
            padding: 8px;
        }
        
        th {
            background-color: #f2f2f2;
        }
        
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        
        tr:hover {
            background-color: #ddd;
        }
        
          #maincontent{
        margin-left:15px;
        }
     
         
    </style>
</head>
<body>
   <%String email=(String)session.getAttribute("email"); %>
   
   <table>
   
   <tr> <td><a href="/citizens">CITIZENS</a></td> <td><a href="AddVaccinationCenter.jsp">ADD VACCINATION CENTERS</a></td> 
   
   <td> <a href="/Logout.jsp">LOG OUT</a> </td> <td><h4>WELCOME, <%=email %></h4></td>  </tr>
   
   </table>
  
  <div id="maincontent">
  
 
<h3  >CENTERS</h3></br>
     
<table border="7" cellspacing="10">
     
     <tr> <th>Id</th>  <th>NAME</th>  <th>CITY</th>  <th>VIEW</th>  <th>EDIT</th> <th>DELETE</th></tr>
       <%
     
       List<VaccineCenter> list = (List<VaccineCenter>)request.getAttribute("listofcenters");
       int count=0;
       
     
     for(VaccineCenter vc:list){
     String id = String.valueOf(vc.getId());
     %>
     <tr> <td><%=vc.getId() %></td> <td> <%=vc.getName() %></td> <td> <%=vc.getCity() %></td> <td><a href="viewCenterById/<%=id%>">VIEW</a></td>
     <td><a href="getCenterToUpdate/<%=id%>">EDIT</a></td><td><a href="deleteCenter/<%=id%>">DELETE</a></td></tr>
     <%count++; %>
     <%} %>
     
     </table></br>
     
     <h3   >TOTAL VACCINATION CENTERS: <%=count %> </h3>
     
    </div>
     
     
</body>
</html>