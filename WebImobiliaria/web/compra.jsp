<%@page import="br.com.fatecpg.imobiliaria.Imovel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String error = null;
    if (request.getParameter("formDeleteImovel") != null){
        try{
            long id = Long.parseLong(request.getParameter("id"));
            Imovel.removeImovel(id);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }    
    
    if (request.getParameter("formNewImovel") != null){
        String bairro = request.getParameter("bairro");
        String avenida = request.getParameter("avenida");
        String estado = request.getParameter("estado");
        String pessoa = request.getParameter("pessoa");
        String tipo = request.getParameter("tipo");
        String quarto = request.getParameter("quarto");
        String banheiro = request.getParameter("banheiro");
        String suite = request.getParameter("suite");
        String garagem = request.getParameter("garagem");
        String tamanho = request.getParameter("tamanho");
        try {
            Imovel.addImovel(bairro, avenida, estado, pessoa, tipo, quarto, banheiro, suite, garagem, tamanho);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e){
            error = e.getMessage();
        }
} %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Imobiliária - FatecPG</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Imóveis</h1>
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
                    Bairro: <input type="text" name="bairro" />  
                    Avenida: <input type="text" name="avenida" />  
                    Estado:
                    <select name="estado">
                        <option value="Acre - AC">AC</option>
                        <option value="Alagoas - AL">AL</option>
                        <option value="Amapá - AP">AP</option>
                        <option value="Amazonas - AM">AM</option>
                        <option value="Bahia - BA">BA</option>
                        <option value="Ceará - CE">CE</option>
                        <option value="Distrito Federeal - DF">DF</option>
                        <option value="Espírito Santo - ES">ES</option>
                        <option value="Goiás - GO">GO</option>
                        <option value="Maranhão - MA">MA</option>
                        <option value="Mato Grosso - MT">MT</option>
                        <option value="Mato Grosso do Sul - MS">MS</option>
                        <option value="Minas Gerais - MG">MG</option>
                        <option value="Pará - PA">PA</option>
                        <option value="Paraíba - PB">PB</option>
                        <option value="Paraná - PR">PR</option>
                        <option value="Pernambuco - PE">PE</option>
                        <option value="Piauí - PI">PI</option>
                        <option value="Rio de Janeiro - RJ">RJ</option>
                        <option value="Rio Grande do Norte - RN">RN</option>
                        <option value="Rio Grande do Sul - RS">RS</option>
                        <option value="Rondônia - RO">RO</option>
                        <option value="Roraima - RR">RR</option>
                        <option value="Santa Catarina - SC">SC</option>
                        <option value="São Paulo - SP">SP</option>
                        <option value="Sergipe - SE">SE</option>
                        <option value="Tocantins - TO">TO</option>
                    </select> 
                    Pessoa: <input type="text" name="pessoa" />  
                    Tipo: 
                    <select name="tipo">
                        <option value="Apartamento">Apartamento</option>
                        <option value="Casa">Casa</option>
                        <option value="Chácara">Chácara</option>
                        <option value="Cobertura">Cobertura</option>
                        <option value="Fazenda">Fazenda</option>
                        <option value="Galpão">Galpão</option>
                        <option value="Loja">Loja</option>
                        <option value="Prédio">Prédio</option>
                    </select>  
                    Quartos: <input type="text" name="quarto" />  
                    Banheiro: <input type="text" name="banheiro" />  
                    Suite: <input type="text" name="suite" />  
                    Garagem: <input type="text" name="garagem" />  
                    Tamanho: <input type="text" name="tamanho" />  
                    <input type="submit" name="formNewImovel" value="Cadastrar" />
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
                                    <input type="submit" name="formDeleteImovel" value="Remover" />
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
