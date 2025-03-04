<html>
<head>
    <title>Exemplo de JSP Built-In Objects</title>
</head>
<body>
    <h1>Exemplo de Built-In Objects</h1>

    <!-- Utilizando o objeto request para obter informa��es da requisi��o -->
    <p>Endere�o IP do Cliente: <%= request.getRemoteAddr() %></p>
    <p>URL Requisitada: <%= request.getRequestURL() %></p>

    <!-- Utilizando o objeto session para armazenar e recuperar dados da sess�o -->
    <%
        String usuario = (String) session.getAttribute("usuario");
        if (usuario == null) {
            usuario = "Visitante";
            session.setAttribute("usuario", usuario);
        }
    %>
    <p>Bem-vindo, <%= usuario %>!</p>

    <!-- Utilizando o objeto application para acessar informa��es do contexto da aplica��o -->
   <p>Contexto da Aplica��o: <%= application.getContextPath() %></p>


    <!-- Utilizando o objeto config para acessar configura��es do servlet -->
    <p>Nome do Servlet Config: <%= config.getServletName() %></p>

    <!-- O objeto out � utilizado para enviar a sa�da para o cliente -->
    <%
        out.println("<p>Esta mensagem foi gerada usando o objeto out.</p>");
    %>
</body>
</html>
