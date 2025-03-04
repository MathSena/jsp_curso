<%@ page import="br.com.mathsena.util.Calculadora" %>
<html>
<head>
    <title>Exemplo de Chamada a Classe Java</title>
</head>
<body>
    <h1>Chamada a Classe Java a partir do JSP</h1>
    <% 
        // Instancia a classe Calculadora
        Calculadora calc = new Calculadora();
        // Chama o método somar e armazena o resultado
        int resultado = calc.somar(10, 15);
    %>
    <p>O resultado da soma de 10 e 15 é: <%= resultado %></p>
</body>
</html>
