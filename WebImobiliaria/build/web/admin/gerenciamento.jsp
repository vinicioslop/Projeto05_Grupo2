<%@page import="br.com.fatecpg.imobiliaria.Historico"%>
<%@page import="br.com.fatecpg.imobiliaria.Imovel"%>
<%@page import="br.com.fatecpg.imobiliaria.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String error = null;
    int opcoes = 30;
    if (request.getParameter("formDeleteUser") != null) {
        try {
            long id = Long.parseLong(request.getParameter("id"));
            User.removeUser(id);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }

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

    if (request.getParameter("formDeleteImovel") != null) {
        try {
            long id = Long.parseLong(request.getParameter("id"));
            Historico.removeImovel(id);
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
            <h1>Gerenciamento do Site</h1>
            <% if (session.getAttribute("user") == null) { %>
            <h2>É preciso estar autenticado para acessar este recurso</h2>
            <% } else {
                User user = (User) session.getAttribute("user");
                if (!user.getRole().equals("ADMIN")) { %>
            <h2>Você não tem permissão para acessar este recurso!</h2>
            <% } else {
                if (errorMessage != null) {%>
            <h2 style="color: red"><%= error%></h2>
            <% } %>
            <fieldset>
                <legend>Cadastrar novo usuário</legend>
                <form class="my-3">
                    Nome: <input type="text" class="form-control" name="name" /><br>
                    Papel: 
                    <select name="role">
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
                    <% for (User u : User.getUsers()) {%>
                    <tr>
                        <td><%= u.getId()%></td>
                        <td><%= u.getRole()%></td>
                        <td><%= u.getName()%></td>
                        <td><%= u.getLogin()%></td>
                        <td>
                            <form>
                                <input type="hidden" name="id" value="<%= u.getId()%>" />
                                <input type="submit" name="formDeleteUser" value="Remover" class="btn botaoForm mb-4"/>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <br>
            <br><h2>Imóveis Comprados</h2>
            <table border="1" id="customers">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Disponibilidade</th>
                        <th>Bairro</th>
                        <th>Avenida</th>
                        <th>Estado</th>
                        <th>Pessoa</th>
                        <th>Tipo</th>
                        <th>Quarto</th>
                        <th>Banheiro</th>
                        <th>Suite</th>
                        <th>Numero de vagas da garagem</th>
                        <th>Tamanho</th>
                        <th>Preço</th>
                        <th>Comandos</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (Historico h : Historico.getHistorico()) {%>
                    <tr>
                        <td><%= h.getId()%></td>
                        <td><%= h.getDisponibilidade()%></td>
                        <td><%= h.getBairro()%></td>
                        <td><%= h.getAvenida()%></td>
                        <td><%= h.getEstado()%></td>
                        <td><%= h.getPessoa()%></td>
                        <td><%= h.getTipo()%></td>
                        <td><%= h.getQuarto()%></td>
                        <td><%= h.getBanheiro()%></td>
                        <td><%= h.getSuite()%></td>
                        <td><%= h.getGaragem()%></td>
                        <td><%= h.getTamanho()%></td>
                        <td><%= h.getPreco()%></td>
                        <td>
                            <form>
                                <input type="hidden" name="id" value="<%= h.getId()%>" />
                                <input type="submit" name="formDeleteImovel" value="Remover" class="btn botaoForm mb-4"/>
                            </form>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <% } %>
            <% }%>
        </div>
        <br><br><br>
    <center><footer class="container">
            <p>&copy; Fatec Praia Grande-2018</p>
        </footer></center>
</body>
</html>