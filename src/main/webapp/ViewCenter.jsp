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
<title>View Center</title>
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
       <% VaccineCenter vc=(VaccineCenter)request.getAttribute("center");
         List<Citizen> citizenslist=(List<Citizen>)request.getAttribute("citizenslist");
         %>
         
         <div align="center">
            <h1>VACCINE CENTER</h1></br></br>
            
            <table>
             
             <tr><td>ID</td><td><%=vc.getId() %></td></tr>
              <tr><td>NAME</td><td><%=vc.getName() %></td></tr>
               <tr><td>CITY</td><td><%=vc.getCity() %></td></tr>
            
             </table></br></br>
             
             <h1>CITIZEN(S) WHO GOT INNCOCULATED IN THE ABOVE CENTER</h1>
             <%
               if(citizenslist.isEmpty())
               { %>
            	   <h4> This Vaccine Center has not vaccinated anyone yet!</h4>
              
             <%  } %>
              <%for(Citizen c: citizenslist){ %>
              <table>
            
             
                <tr><td>ID</td><td><%=c.getId() %></td></tr>
               <tr><td>NAME</td><td><%=c.getName() %></td></tr>
                <tr><td>CITY</td><td><%=c.getCity() %></td></tr>
                <tr><td>NO OF DOSES</td><td><%=c.getDoseCount() %></td></tr>
                <tr><td>VACCINATION STATUS</td><td><%=c.getVaccinationStatus() %></td></tr>
                 <tr><td>VACCINATION CENTER NAME</td><td><%=c.getVc().getName() %></td></tr>
              
           
           </table>
             <h6>-------------------------------------------------------------------------</h6>
             <%} %>
           <a href="/vaccinationcenter">Go Back</a>
         
         </div>
</body>
</html>