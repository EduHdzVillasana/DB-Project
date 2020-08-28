<%-- 
    Document   : insert
    Created on : 28 may. 2020, 23:53:26
    Author     : alana
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mycompany.prueba3web.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Pais PIA</title>
    </head>
    <body>
        <div class="container mt-5">
            <h1>
                <%
                    String nombre = request.getParameter("nombre");
                    if (nombre != null && nombre != "") {
                        DbConnection conector = new DbConnection();
                        Connection con = conector.getConn();
                        Statement st = con.createStatement();
                        String sql = "INSERT INTO Paises VALUES ('" + nombre + "')";
                        st.executeUpdate(sql);
                        con.close();
                        conector.closeConn();
                        out.print("Se ha añadido satisfactoriamente a " + nombre);
                    } else {
                        out.print("Los datos recibidos no son validos");
                    }
                %>
            </h1>
            <br>
            <a class="btn btn-secondary" href="index.html" role="button">Volver a Menu</a>
        </div>
    </body>
</html>
