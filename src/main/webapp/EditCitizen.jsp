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
<title>Edit Citizen</title>
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
      <h1>EDIT A CITIZEN</h1>
          <%Optional<Citizen> citizentobeEdited=(Optional<Citizen>)request.getAttribute("citizenToBeEdited");
          List<VaccineCenter> list=(List<VaccineCenter>) request.getAttribute("listofcenters"); 
         Citizen citizen = citizentobeEdited.orElse(null);
         %>
           <form action="/updateCitizen">
           
           <table>
                <input type="hidden" value="<%=citizen.getId()%>" name="citizenid">
             <tr> <td>CITIZEN NAME</td>  <td><input type="text" name="updatedName" value="<%=citizen.getName()%>"></td>   </tr>
             <tr> <td>CITIZEN CITY</td>  <td><input type="text" name="updatedCity" value="<%=citizen.getCity()%>"></td>   </tr>
               
           <tr>  <td>NO OF DOSES</td> <td>     
           
           <select name="doseCountUpdated" >
           
           <option value="0">0</option>
		  <option value="1">1</option>
		  <option value="2">2</option>
		</select>
           
         </td></tr>
         
           <tr>  <td>CENTER NAME</td> <td>
           
            <select name="centerNameUpdated" >
            
            <%for(VaccineCenter vc:list){ %>
		  <option value="<%=vc.getName()%>"><%=vc.getName()%></option>
            <%} %>
		</select>
           
           
          </td></tr>
             <tr> <td></td>  <td><input type="submit" value="Update"></td>   </tr>
           
           </table>
           </form></br></br>
           
            <a href="/citizens">Go Back</a> </br></br>
   
   </div>
</body>
</html>

