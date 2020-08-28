<%--
    Document   : index
    Created on : 24 may. 2020, 13:09:56
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
        <title>Prueba 3 JSP</title>
    </head>
    <body>
        <div class="container mt-5">
            <h1>Ingresa los datos</h1>
            <br>
            <div class="row">
                <div class="col-sm">
                    <form action = "index.jsp" method="POST">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" class="form-control" name="nombre" aria-describedby="emailHelp" placeholder="Nombre" Value = "Prueba2">
                            <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                        </div>
                        <div class="form-group">
                            <label>Edad</label>
                            <input type="text" class="form-control" name="edad" aria-describedby="emailHelp" placeholder="Edad" Value = "2020">
                            <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                        </div>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm">
                    <div class="alert alert-primary" role="alert">
                        <%
                            int edad;
                            String nombre = request.getParameter("nombre");
                            String edadtmp = request.getParameter("edad");
                            if (nombre != null && edadtmp != null && nombre != "" && edadtmp != "")
                            {
                                if (Metodos.isNumeric(edadtmp))
                                {
                                    edad = Integer.parseInt(edadtmp);
                                    out.print("Nombre: " + nombre + "<br>Edad: " + edad + "<br> Usuario Agregado");
                                    DbConnection conector = new DbConnection ();
                                    Connection con = conector.getConn();
                                    Statement st = con.createStatement();
                                    String sql = "INSERT INTO Users VALUES ('" + nombre + "' , " + edad + ")";
                                    st.executeUpdate(sql);
                                    con.close();
                                    conector.closeConn();
                                }
                                else
                                {
                                    out.print("En edad solo se aceptan datos numericos");
                                }
                            } 
                            else 
                            {
                                nombre = "";
                                edad = 0;
                                out.print("Datos incompletos");
                            }
                        %>
                    </div>
                </div>
            </div>
            <br>
            <div class ="row">
                <h2>Tabla de Base de Datos</h2>
            </div>
            <br>
            <div class="row">
                <div class="col-sm">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Id_user</th>
                                <th scope="col">Nombret</th>
                                <th scope="col">Edad</th>
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
                                DbConnection conector = new DbConnection ();
                                Connection con = conector.getConn();
                                Statement st = con.createStatement();;
                                ResultSet rs = st.executeQuery("SELECT * FROM Users");
                                while (rs.next()) {
                                    out.print(" <tr>"
                                            + "<th scope=\"row\">" + rs.getInt("id_user") + "</th>"
                                            + "<td>" + rs.getString("name") + "</td>"
                                            + "<td>" + rs.getInt("age") + "</td>"
                                            + "</tr>");
                                }
                                con.close();
                                conector.closeConn();
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
