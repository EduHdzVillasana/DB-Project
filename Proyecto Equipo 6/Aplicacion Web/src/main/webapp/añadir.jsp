<%-- 
    Document   : añadir
    Created on : 28 may. 2020, 23:50:16
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
    <body>
        <div class="container mt-5">
            <h1>Ingresa los datos</h1>
            <br><br>
            <div class="row">
                <div class="col-sm">
                    <form action = "insert.jsp" method="GET">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" class="form-control" name="nombre" aria-describedby="emailHelp" placeholder="Nombre" >
                            <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                        </div>
                        <button type="submit" class="btn btn-primary">Añadir</button>
                    </form>
                </div>
            </div>
            <br>
            <a class="btn btn-secondary" href="index.html" role="button">Volver a Menu</a>
        </div>
    </body>
</html>
