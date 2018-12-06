<%-- 
    Document   : cadastro_usuario
    Created on : 06/12/2018, 15:05:00
    Author     : Nicole
--%>
<%@page import="br.com.fatecpg.imobiliaria.Historico"%>
<%@page import="br.com.fatecpg.imobiliaria.Imovel"%>
<%@page import="br.com.fatecpg.imobiliaria.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
    String error = null;
    if (request.getParameter("cadastro_usuario") != null) {

        String name = request.getParameter("name");
        String role = request.getParameter("role");
        String login = request.getParameter("login");
        long passwordHash = request.getParameter("pass").hashCode();
        try {
            User.addUser(role, name, login, passwordHash);
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
        <link href="jumbotron.css" rel="stylesheet">
        <title>Imobiliária - FatecPG</title>
        
    </head>
    <body>
            <%@include file="../WEB-INF/jspf/header.jspf" %>
            
            <div class="container">
            <fieldset>
                <legend>Cadastro de Usuario</legend>
                <form class="my-3">
                    Nome: <input type="text" class="form-control" name="name" /><br>
                    Papel: 
                    <select name="role">
                        <option value="USUARIO">Usuário</option>
                    </select><br>
                    Usuário: <input type="text" class="form-control" name="login" />   
                    Senha: <input type="password" class="form-control" name="pass" /><br>
                    <center><input type="submit" name="cadastro_usuario" value="Cadastrar" class="btn botaoForm mb-4" /></center>
                </form>
            </fieldset>
        </div>
        <br><br><br>
    <center><footer class="container">
            <p>&copy; Fatec Praia Grande-2018</p>
        </footer></center>
</body>
</html>