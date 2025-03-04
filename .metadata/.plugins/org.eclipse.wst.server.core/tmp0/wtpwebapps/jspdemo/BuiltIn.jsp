<html>
<head>
    <title>Exemplo de JSP Built-In Objects</title>
</head>
<body>
    <h1>Exemplo de Built-In Objects</h1>

    <!-- Utilizando o objeto request para obter informações da requisição -->
    <p>Endereço IP do Cliente: <%= request.getRemoteAddr() %></p>
    <p>URL Requisitada: <%= request.getRequestURL() %></p>

    <!-- Utilizando o objeto session para armazenar e recuperar dados da sessão -->
    <%
        String usuario = (String) session.getAttribute("usuario");
        if (usuario == null) {
            usuario = "Visitante";
            session.setAttribute("usuario", usuario);
        }
    %>
    <p>Bem-vindo, <%= usuario %>!</p>

    <!-- Utilizando o objeto application para acessar informações do contexto da aplicação -->
   <p>Contexto da Aplicação: <%= application.getContextPath() %></p>


    <!-- Utilizando o objeto config para acessar configurações do servlet -->
    <p>Nome do Servlet Config: <%= config.getServletName() %></p>

    <!-- O objeto out é utilizado para enviar a saída para o cliente -->
    <%
        out.println("<p>Esta mensagem foi gerada usando o objeto out.</p>");
    %>
</body>
</html>
