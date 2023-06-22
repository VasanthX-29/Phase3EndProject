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
<title>Add Citizen</title>
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
        background-color: #f9f9f9;
    }

    table tr:nth-child(odd) {
        background-color: #f1f1f1;
    }

  
</style>
</head>
<body>

   <div align="center">
   <h2>ADD A CITIZEN</h2><br></br>
   
   <%List<VaccineCenter> list=(List<VaccineCenter>) request.getAttribute("listofcenters"); %>
      <form action="/addCitizen">
           
           <table>
           
           <tr>  <td>CITIZEN NAME</td> <td> <input type="text" name="cName"></td> </tr>
           
           <tr>  <td>CITIZEN CITY</td> <td><input type="text" name="cCity"> </td>    </tr>
           
           <tr>  <td>NO OF DOSES</td> <td>     
           
           <select name="doseCount" >
            <option value="0">0</option>
		  <option value="1">1</option>
		  <option value="2">2</option>
		</select>
           
           
          </td></tr>
           
           <tr>  <td>CENTER NAME</td> <td>
           
            <select name="centerName" >
            
            <%for(VaccineCenter vc:list){ %>
		  <option value="<%=vc.getName()%>"><%=vc.getName()%></option>
            <%} %>
		</select>
           
           
          </td></tr>
          
          <tr><td></td><td><input type="submit" value="Add"></td></tr>
           
           </table>
         
         </form>   </br</br></br>
         
          <a href="/citizens">Go Back</a> </br></br>
   
   </div>
        
</body>
</html>