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
<%String error = null;
    if (request.getParameter("formNewUser") != null) {
        String role = request.getParameter("role");
        String name = request.getParameter("name");
        String login = request.getParameter("login");
        long passwordHash = request.getParameter("pass").hashCode();
        String tipo = request.getParameter("tipo");
        String bandeira = request.getParameter("bandeira");
        String numeracao = request.getParameter("numeracao");
        String nascimento = request.getParameter("nascimento");
        String vencimento = request.getParameter("vencimento");
        String codigo = request.getParameter("codigo");
        long saldo = Long.parseLong(request.getParameter("saldo"));
        try {
            User.addUser(role, name, login, passwordHash, tipo, bandeira, numeracao, nascimento, vencimento, codigo, saldo);
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
    <body>
        <div class="container">
            <fieldset>
           <h2>Cadastrar novo usuário</h2>
                <form class="my-3">
                    Nome: <input type="text" class="form-control" name="name" /><br>
                    Papel:<select name="role">
                        <option value="ADMIN">Administrador</option>
                        <option value="FUNCIONARIO">Funcionário</option>
                        <option value="USUARIO">Usuário</option>
                    </select><br>
                    Usuário: <input type="text" class="form-control" name="login" />   
                    Senha: <input type="password" class="form-control" name="pass" /><br>
                    Tipo de cartão:
                    <select name="tipo">
                        <option value="Crédito">Crédito</option>
                        <option value="Débito">Débito</option>
                    </select><br>
                    Bandeira: <input type="text" class="form-control" name="bandeira" />
                    Numeração: <input type="text" class="form-control" name="numeracao" />
                    Nascimento: <input type="text" class="form-control" name="nascimento" />
                    Vencimento: <input type="text" class="form-control" name="vencimento" />
                    Código: <input type="text" class="form-control" name="codigo" />
                    Saldo: <input type="text" class="form-control" name="saldo" />
                    <center><input type="submit" name="formNewUser" value="Cadastrar" class="btn botaoForm mb-4" /></center>
                </form>
            </fieldset>
        </div>
    </body>
    <center>
        <footer class="container">
            <p>&copy; Fatec Praia Grande-2018</p>
        </footer>
    </center>
</body>
</html>