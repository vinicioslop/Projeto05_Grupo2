<%@page import="br.com.fatecpg.imobiliaria.User"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="br.com.fatecpg.imobiliaria.Historico"%>
<%@page import="br.com.fatecpg.imobiliaria.Imovel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String error = null;
    int opcoes = 30;
     DecimalFormat decimalFormat = new DecimalFormat();
    decimalFormat.setMaximumFractionDigits(2);
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
            <h1>Imóveis disponíveis para compra ou aluguel</h1>
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
                        <td><%= "R$ "+decimalFormat.format(i.getPreco())%></td>
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