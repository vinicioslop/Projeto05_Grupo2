<%@page import="br.com.fatecpg.imobiliaria.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../../../favicon.ico">
        <!-- Bootstrap core CSS -->
        <link href="../resource/css/css/bootstrap.min.css" rel="stylesheet">
        <link href="../resource/css/css/bootstrap.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="jumbotron.css" rel="stylesheet">
        <title>Imobiliária - FatecPG</title>
        <%@include file="../WEB-INF/jspf/header.jspf" %>
    </head>
    <body><div class="container">
            <h1>Perfil</h1>
            <% if (session.getAttribute("user") == null) { %>
            <h2>É preciso estar autenticado para acessar este recurso</h2>
            <% } else {
                User user = (User) session.getAttribute("user");
            %>
            <h2>Usuário Conectado</h2>
            <table id="customers">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Papel</th>
                        <th>Nome</th>
                        <th>Login</th>
                        <th>Tipo de cartão</th>
                        <th>Bandeira do cartão</th>
                        <th>Data de Nascimento</th>
                        <th>Saldo</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= user.getId()%></td>
                        <td><%= user.getRole()%></td>
                        <td><%= user.getName()%></td>
                        <td><%= user.getLogin()%></td>
                        <td><%= user.getTipo()%></td>
                        <td><%= user.getBandeira()%></td>
                        <td><%= user.getNascimento()%></td>
                        <td><%= user.getSaldo()%></td>
                    </tr>
                </tbody>
            </table>
            <br>
            <%}%>
        </div>
        <br><br><br>
    <center><footer class="container">
            <p>&copy; Fatec Praia Grande-2018</p>
        </footer></center>
</body>
</html>