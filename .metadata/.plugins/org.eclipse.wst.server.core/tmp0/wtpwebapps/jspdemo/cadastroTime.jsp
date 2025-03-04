<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultado do Cadastro de Time</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        p {
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <h1>Time de Futebol Cadastrado</h1>
    
    <%
        // Recupera os dados enviados pelo formulário através do objeto request
        String nome = request.getParameter("nome");
        String cidade = request.getParameter("cidade");
        String fundacaoStr = request.getParameter("fundacao");
        String tecnico = request.getParameter("tecnico");
        String divisao = request.getParameter("divisao");
        String status = request.getParameter("status");
        // Para checkboxes, usamos getParameterValues para receber um array de valores
        String[] competicoes = request.getParameterValues("competicoes");
        
        // Conversão do campo "fundacao" de String para inteiro com tratamento de exceção
        int fundacao = 0;
        try {
            fundacao = Integer.parseInt(fundacaoStr);
        } catch(NumberFormatException e) {
            out.println("<p>Erro ao converter o ano de fundação. Verifique o valor informado.</p>");
        }
        
        // Processa o valor da drop-down list para um nome amigável
        String divisaoNome;
        switch(divisao) {
            case "serie_a":
                divisaoNome = "Série A";
                break;
            case "serie_b":
                divisaoNome = "Série B";
                break;
            case "serie_c":
                divisaoNome = "Série C";
                break;
            case "serie_d":
                divisaoNome = "Série D";
                break;
            default:
                divisaoNome = "Não especificada";
        }
        
        // Processa o valor dos radio buttons para status
        String statusNome = "Não especificado";
        if ("profissional".equals(status)) {
            statusNome = "Profissional";
        } else if ("amador".equals(status)) {
            statusNome = "Amador";
        }
    %>
    
    <!-- Exibe os dados do time cadastrado -->
    <p><strong>Nome do Time:</strong> <%= nome %></p>
    <p><strong>Cidade:</strong> <%= cidade %></p>
    <p><strong>Ano de Fundação:</strong> <%= fundacao %></p>
    <p><strong>Técnico:</strong> <%= tecnico %></p>
    <p><strong>Divisão:</strong> <%= divisaoNome %></p>
    <p><strong>Status do Time:</strong> <%= statusNome %></p>
    
    <p><strong>Competições:</strong>
    <%
        if (competicoes != null) {
            // Itera sobre o array de competições e exibe os valores selecionados
            for (int i = 0; i < competicoes.length; i++) {
                out.print(competicoes[i]);
                if (i < competicoes.length - 1) {
                    out.print(", ");
                }
            }
        } else {
            out.print("Nenhuma competição selecionada.");
        }
    %>
    </p>
    
    <!--
         Comentários:
         - Os parâmetros são recuperados usando request.getParameter() para campos únicos e getParameterValues() para checkboxes.
         - A conversão de "fundacao" é feita com um try-catch para evitar erros de formato.
         - Um switch processa o valor da drop-down list para apresentar um nome amigável.
         - Os radio buttons são verificados com uma estrutura condicional (if-else).
         - Os valores dos checkboxes são iterados para exibir todas as competições selecionadas.
    -->
</body>
</html>
