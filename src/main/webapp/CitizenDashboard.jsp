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
<title>Dashboard</title>
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
         
         <tr> <td><a href="/citizen">ADD CITIZENS</a></td> <td> <a href="/vaccinationcenter">GO TO VACCINEDASHBOARD</a> </td>
         
         <td><a href="/Logout.jsp">LOG OUT</a></td> <td> <h4>WELCOME, <%=email %></h4></td> </tr>
         </table>
   
    
    <div id="maincontent">
    
    
  
    <h3 >CITIZENS</h3></br>
     
   
     
     <table border="7" cellspacing="10">
     
     <tr> <th>Id</th>  <th>NAME</th>  <th>CITY</th>  <th>NO OF DOSES</th>  <th>VACCINATION STATUS</th>   
     <th>VACCINATION CENTER</th>  <th>VIEW</th>  <th>EDIT</th> <th>DELETE</th>     </tr>
       <%
     
       List<Citizen> list = (List<Citizen>)request.getAttribute("listofcitizens");
       int count=0;
     
     for(Citizen c:list){
     String centerName=c.getVc().getName();
     String id = String.valueOf(c.getId());
     %>
     <tr> <td><%=c.getId() %></td> <td> <%=c.getName() %></td> <td> <%=c.getCity() %></td> 
     
     <td> <%=c.getDoseCount() %></td> <td> <%=c.getVaccinationStatus() %></td>  <td> <%=centerName %></td> <td> <a href="viewCitizenById/<%=id%>">VIEW</a></td>
     
     
     <td><a href="getCitizenToUpdate/<%=id%>">EDIT</a></td><td><a href="deleteCitizen/<%=id%>">DELETE</a></td></tr>
     <%count++; %>
     <%} %>
     
     </table></br>
     
     <h3 >TOTAL CITIZENS: <%=count %></h3>
     
       </div>
     
</body>
</html>