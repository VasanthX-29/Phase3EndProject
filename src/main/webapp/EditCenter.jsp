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
<title>EDIT A CENTER</title>
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

    table tr:nth-child(odd) {
        background-color: #e8e8e8;
    }

    
</style>
</head>
<body>
        <div align="center">
        <h2>EDIT A VACCINE CENTER</h2>
         
         <%Optional<VaccineCenter> vc=(Optional<VaccineCenter>)request.getAttribute("centerToBeEdited");
         VaccineCenter center = vc.orElse(null);
         %>
           <form action="/updateCenter">
           
           <table>
                <input type="hidden" value="<%=center.getId()%>" name="cid">
             <tr> <td>ENTER NAME</td>  <td><input type="text" name="updatedName" value="<%=center.getName()%>"></td>   </tr>
             <tr> <td>ENTER CITY</td>  <td><input type="text" name="updatedCity" value="<%=center.getCity()%>"></td>   </tr>
             <tr> <td></td>  <td><input type="submit" value="Update"></td>   </tr>
           
           </table>
           
           
           </form> </br></br>
           
           <a href="/vaccinationcenter">Go Back</a> </br></br>
        </div>
        
        
</body>
</html>