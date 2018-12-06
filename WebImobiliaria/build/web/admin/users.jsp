<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String error = null;
    if (request.getParameter("formDeleteUser") != null){
        try{
            long id = Long.parseLong(request.getParameter("id"));
            User.removeUser(id);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }    
    
    if (request.getParameter("formNewUser") != null){
        String name = request.getParameter("name");
        String role = request.getParameter("role");
        String login = request.getParameter("login");
        long passwordHash = request.getParameter("pass").hashCode();
        try {
            User.addUser(role, name, login, passwordHash);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e){
            error = e.getMessage();
        }
} %>
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
    <body>
        <h1>Usuários</h1>
        <% if (session.getAttribute("user") == null) { %>
            <h2>É preciso estar autenticado para acessar este recurso</h2>
        <% } else { 
            User user = (User) session.getAttribute("user");
            if (!user.getRole().equals("ADMIN")) { %>
                <h2>Você não tem permissão para acessar este recurso!</h2>
            <% } else { 
                if (errorMessage != null) { %>
                    <h2 style="color: red"><%= error %></h2>
                <% } %>
            <fieldset>
                <legend>Cadastrar novo usuário</legend>
                <form class="my-3">
                    Nome: <input type="text" class="form-control" name="name" />
                    Papel: 
                    <select name="role">
                        <option value="ADMIN">ADMIN</option>
                        <option value="FUNCIONARIO">FUNCIONARIO</option>
                        <option value="VISITANTE">VISITANTE</option>
                    </select><br>
                    Usuário: <input type="text" class="form-control" name="login" />   
                    Senha: <input type="password" class="form-control" name="pass" /><br>
                    <center><input type="submit" name="formNewUser" value="Cadastrar" class="btn botaoForm mb-4" /></center>
                </form>
            </fieldset>
            <br><h2>Usuários Cadastrados</h2>
            <table id="customers">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Papel</th>
                        <th>Nome</th>
                        <th>Login</th>
                        <th>Comandos</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (User u : User.getUsers()) { %>
                        <tr>
                            <td><%= u.getId() %></td>
                            <td><%= u.getRole()%></td>
                            <td><%= u.getName()%></td>
                            <td><%= u.getLogin()%></td>
                            <td>
                                <form>
                                    <input type="hidden" name="id" value="<%= u.getId() %>" />
                                    <input type="submit" name="formDeleteUser" value="Remover" class="btn botaoForm mb-4"/>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
            <% } %>
        <% } %>
    </body>
</html>
