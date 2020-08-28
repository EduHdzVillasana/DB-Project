<%-- 
    Document   : visualizar
    Created on : 29 may. 2020, 0:24:46
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
            <h1>Tabla de Paises</h1>            
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Id_pais</th>
                        <th scope="col">Nombre de pais</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        /*Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        // Quitar puerto si no se puede
                        String connectionURL = "jdbc:sqlserver://LAPTOP-41RP8IC0\\SQLEXPRESS:1433;"
                                + "databaseName=JavaWeb;"
                                + "user = usuarioSQL;"
                                + "password = 1234; ";*/
                        DbConnection conector = new DbConnection();
                        Connection con = conector.getConn();
                        Statement st = con.createStatement();;
                        ResultSet rs = st.executeQuery("SELECT * FROM Paises");
                        String modo = request.getParameter("modo");
                        
                        while (rs.next()) 
                        {
                            out.print(" <tr>"
                                    + "<th scope=\"row\">" + rs.getInt("id_pais") + "</th>"
                                    + "<td>" + rs.getString("name") + "</td>");
                            if (modo.equals("2"))
                            {
                                out.print("<td><a class=\"btn btn-primary\" href=\"actualizar.jsp?id="+ rs.getString("id_pais") + "&nombre="+ rs.getString("name")+"\" role=\"button\">Actualizar</a></td>");
                            }
                            if (modo.equals("3"))
                            {
                                out.print("<td><a class=\"btn btn-danger\" href=\"delete.jsp?id="+ rs.getString("id_pais") +"&nombre="+ rs.getString("name")+"\" role=\"button\">Eliminar</a></td>");
                            }
                            out.print("</tr>");
                        }
                        con.close();
                        conector.closeConn();
                    %>
                </tbody>
            </table>
            <br>
            <a class="btn btn-secondary" href="index.html" role="button">Volver a Menu</a>
        </div>
    </body>
</html>
