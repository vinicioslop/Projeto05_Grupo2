<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.imobiliaria.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../../../favicon.ico">
        <title>Página Inicial - Imobiliária Fatec-PG</title>
        <!-- Bootstrap core CSS -->
        <link href="resource/css/css/bootstrap.min.css" rel="stylesheet">
        <link href="resource/css/css/bootstrap.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="jumbotron.css" rel="stylesheet">
    </head>
    <body>
        
        <div class="jumbotron">
                <div class="container">
                    <h1 class="display-3">Imobiliária</h1>
                    <p>Seja Bem- Vindo!</p>
                    <p><%@include file="WEB-INF/jspf/header.jspf" %></p>
                </div>
        </div>
        <main role="main">
            <div class="row mb-5">
                <div class="col-sm-4">
                    <div class="card">   
                        <div class="card-body">
                            <h4 class="card-title">Ana Paula</h4>                        
                            <p class="card-text"> 
                                
                            </p>
                        </div>
                        <div class="card-footer text-muted">
                            Integrante da Equipe
                        </div>
                    </div>

                </div>
                <div class="col-sm-4">
                    <div class="card">   
                        <div class="card-body">
                            <h4 class="card-title">Nicole Medina</h4>                        
                            <p class="card-text">
                                   
                            </p>
                        </div>   

                        <div class="card-footer text-muted">
                            Integrante da Equipe
                        </div>
                    </div>

                </div>
                <div class="col-sm-4">
                    <div class="card">   
                        <div class="card-body">
                            <h4 class="card-title">Vinícius Lopes</h4>                        
                            <p class="card-text"> 
                                
                            </p>
                        </div>   

                        <div class="card-footer text-muted">
                            Integrante da Equipe
                        </div>
                    </div>

                </div>
            </div>
        </main>
        <br><br><br>
    <center><footer class="container">
            <p>&copy; Fatec Praia Grande-2018</p>
        </footer></center>

    <!-- JS -->
    <script src="resource/css/js/jquery-3.3.1..min.map" ></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="resource/css/js/bootstrap.min.js"></script>
</body>
</html>