<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Vaccination Center</title>
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
          <h2>ADD A NEW VACCINATION CENTER</h2>
          <form action="addCenter">
          
             <table>
             
             <tr> <td>ENTER NAME: </td> <td><input type="text" name="centerName"></td> </tr>
             
             <tr> <td>ENTER CITY: </td> <td><input type="text" name="centerCity"></td> </tr>
             
             <tr> <td></td> <td><input type="submit" value="Submit"></td> </tr>
             
             </table>
          
          </form></br></br>
          
         <a href="/vaccinationcenter">Go Back</a> </br></br>
          
          
          </div>
</body>
</html>