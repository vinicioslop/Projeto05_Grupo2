<%@page import="br.com.fatecpg.imobiliaria.User"%>
<%@page import="br.com.fatecpg.imobiliaria.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    if (request.getParameter("formUpdateUser") != null) {
        try {
            User user = (User) session.getAttribute("user");
            long id = user.getId();
            String name = request.getParameter("name");
            String login = request.getParameter("login");
            long passwordHash = request.getParameter("pass").hashCode();
            
            user.updateUser(id, name, login, passwordHash);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }
%>
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
            <h1>Usuários</h1>
            <% if (session.getAttribute("user") == null) { %>
            <h2>É preciso estar autenticado para acessar este recurso</h2>
            <% } else {
                User user = (User) session.getAttribute("user");
            %>
            <br>
            <fieldset>
                <legend>Atualizar senha</legend>
                <form class="my-3">
                    <input type="hidden" name="id" value="<%= user.getId()%>" />
                    Nome: <input type="text" class="form-control" name="name" /><br>
                    Usuário: <input type="text" class="form-control" name="login" />   
                    Senha: <input type="password" class="form-control" name="pass" /><br>
                    <center><input type="submit" name="formUpdateUser" value="Enviar" class="btn botaoForm mb-4" /></center>
                </form>
            </fieldset>
            <br><h2>Usuário Conectado</h2>
            <table id="customers">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Papel</th>
                        <th>Nome</th>
                        <th>Login</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= user.getId()%></td>
                        <td><%= user.getRole()%></td>
                        <td><%= user.getName()%></td>
                        <td><%= user.getLogin()%></td>
                    </tr>
                </tbody>
            </table>
            <br>
            <% }%>
        </div>
        <br><br><br>
    <center><footer class="container">
            <p>&copy; Fatec Praia Grande-2018</p>
        </footer></center>
</body>
</html>