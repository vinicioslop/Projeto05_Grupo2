<%@page import="br.com.fatecpg.imobiliaria.Historico"%>
<%@page import="br.com.fatecpg.imobiliaria.Imovel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String error = null;
    if (request.getParameter("formComprarImovel") != null) {
        try {
            long id = Long.parseLong(request.getParameter("id"));
            Historico.compraImovel(id);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }
    
    if (request.getParameter("formAlugarImovel") != null) {
        try {
            long id = Long.parseLong(request.getParameter("id"));
            Historico.compraImovel(id);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }

    if (request.getParameter("formNewImovel") != null) {
        String disponibilidade = request.getParameter("comercio");
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
        long preco = Long.parseLong(request.getParameter("preco"));
        try {
            Imovel.addImovel(disponibilidade, bairro, avenida, estado, pessoa, tipo, quarto, banheiro, suite, garagem, tamanho, preco);
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
        <link href="resource/css/css/bootstrap.min.css" rel="stylesheet">
        <link href="resource/css/css/bootstrap.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="jumbotron.css" rel="stylesheet">
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%User user = (User) session.getAttribute("user");%>
        <title>Imobiliária - FatecPG</title>
    </head>
    <body>
        <div class="container">
        <%int opcoes = 30;%>
        <h1>Imóveis</h1>
        <fieldset>
            <legend>Cadastrar novo imóvel</legend>
            <form class="my-3">
                Disponibilidade:
                <select name="disponibilidade">
                    <option value="Aluguel">Aluguel</option>
                    <option value="Compra">Compra</option>
                </select><br>
                Bairro: <input type="text" class="form-control" name="bairro" /><br>
                Avenida: <input type="text" class="form-control" name="avenida" />  <br>
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
                </select> <br>
                Pessoa: <input type="text" class="form-control" name="pessoa" />  <br>
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
                Quartos: 
                <select name="quarto">
                    <option value="Não possui">Não possui</option>
                    <% for (int x = 0; x < opcoes; x++) {%>
                    <option value="<%=x + 1%>"><%=x + 1%></option>
                    <%}%>
                </select>
                Banheiro:
                <select name="banheiro">
                    <option value="Não possui">Não possui</option>
                    <% for (int x = 0; x < opcoes; x++) {%>
                    <option value="<%=x + 1%>"><%=x + 1%></option>
                    <%}%>
                </select>
                Suite:
                <select name="suite" >
                    <option value="Não possui">Não possui</option>
                    <% for (int x = 0; x < opcoes; x++) {%>
                    <option value="<%=x + 1%>"><%=x + 1%></option>
                    <%}%>
                </select>
                Garagem:
                <select name="garagem">
                    <option value="Não possui">Não possui</option>
                    <% for (int x = 0; x < opcoes; x++) {%>
                    <option value="<%=x + 1%>"><%=x + 1%></option>
                    <%}%>
                </select><br>
                Tamanho: <input type="text" class="form-control" name="tamanho" /><br>
                Preço: <input type="text" class="form-control" name="tamanho" /><br>
                <center><input type="submit" name="formNewImovel" class="btn botaoForm mb-4" value="Cadastrar" /></center>
            </form>
        </fieldset>
        <br>
        <h2>Imóveis disponíveis para compra ou aluguel</h2>
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
                <% for (Imovel i : Imovel.getImoveis()) {%>
                <tr>
                    <td><%= i.getId()%></td>
                    <td><%= i.getDisponibilidade()%></td>
                    <td><%= i.getBairro()%></td>
                    <td><%= i.getAvenida()%></td>
                    <td><%= i.getEstado()%></td>
                    <td><%= i.getPessoa()%></td>
                    <td><%= i.getTipo()%></td>
                    <td><%= i.getQuarto()%></td>
                    <td><%= i.getBanheiro()%></td>
                    <td><%= i.getSuite()%></td>
                    <td><%= i.getGaragem()%></td>
                    <td><%= i.getTamanho()%></td>
                    <td><%= i.getPreco()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%= i.getId()%>" />
                            <input type="submit" name="formComprarImovel" value="Comprar" class="btn botaoForm mb-4"/>
                            <input type="hidden" name="id" value="<%= i.getId()%>" />
                            <input type="submit" name="formAlugarImovel" value="Alugar" class="btn botaoForm mb-4"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
        </div>
             <br><br><br>
    <center><footer class="container">
            <p>&copy; Fatec Praia Grande-2018</p>
        </footer></center>
    </body>
    
</html>
