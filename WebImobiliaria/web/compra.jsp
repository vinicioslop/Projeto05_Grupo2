<%@page import="br.com.fatecpg.imobiliaria.Imovel"%>
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
        <title>Usuários - ParkingWebApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
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
                <legend>Novo usuário</legend>
                <form>
                    Nome: <input type="text" name="name" />
                    Papel: 
                    <select name="role">
                        <option value="ADMIN">ADMIN</option>
                        <option value="FUNCIONARIO">FUNCIONARIO</option>
                        <option value="VISITANTE">VISITANTE</option>
                    </select>
                    Usuário: <input type="text" name="login" />   
                    Senha: <input type="password" name="pass" />
                    <input type="submit" name="formNewUser" value="Cadastrar" />
                </form>
            </fieldset>
            <br>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
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
                        <th>Comandos</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Imovel i : Imovel.getImoveis()) { %>
                        <tr>
                            <td><%= i.getId() %></td>
                            <td><%= i.getBairro() %></td>
                            <td><%= i.getAvenida() %></td>
                            <td><%= i.getEstado() %></td>
                            <td><%= i.getPessoa() %></td>
                            <td><%= i.getTipo() %></td>
                            <td><%= i.getQuarto() %></td>
                            <td><%= i.getBanheiro() %></td>
                            <td><%= i.getSuite() %></td>
                            <td><%= i.getGaragem() %></td>
                            <td><%= i.getTamanho() %></td>
                            <td>
                                <form>
                                    <input type="hidden" name="id" value="<%= i.getId() %>" />
                                    <input type="submit" name="formDeleteUser" value="Remover" />
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
