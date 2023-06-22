<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
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
          <h2>REGISTRATION PAGE</h2></br></br>
    <form action="addUser">
    
       <table>
       
         <tr><td>ENTER NAME: </td><td><input type="text" name="uname"></td></tr>
          <tr><td>ENTER EMAIL:</td><td><input type="email" name="uemail"></td></tr>
           <tr><td>ENTER PASSWORD</td><td><input type="password" name="upwd"></td></tr>
            <tr><td></td><td><input type="submit" value="REGISTER"></td></tr>
       
       </table>
    
    
    </form></br></br>
    
    <a href="/index.jsp">Go Back</a>
    
    </div>
</body>
</html>