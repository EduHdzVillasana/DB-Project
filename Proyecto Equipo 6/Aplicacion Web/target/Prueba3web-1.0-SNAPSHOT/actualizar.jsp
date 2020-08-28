<%-- 
    Document   : actualizar
    Created on : 29 may. 2020, 21:09:08
    Author     : alana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Pais PIA</title>
    </head>
    <%
        String nombre = request.getParameter("nombre");
        String id = request.getParameter("id");
    %>
    <body>
        <div class="container mt-5">
            <h1>Ingresa los datos</h1>
            <br><br>
            <div class="row">
                <div class="col-sm">
                    <form action = "update.jsp" method="GET">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" class="form-control" name="nombre" aria-describedby="emailHelp" placeholder="Nombre" value="<%out.print (nombre);%>" >
                            <input type="hidden" name="id" value="<%out.print (id);%>">
                            <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                        </div>
                        <button type="submit" class="btn btn-primary">Actualizar</button>
                    </form>
                </div>
            </div>
            <br>
            <a class="btn btn-secondary" href="index.html" role="button">Volver a Menu</a>
        </div>
    </body>
</html>