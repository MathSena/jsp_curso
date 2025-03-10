<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Recupera a lista de tarefas da sessão (cria se não existir)
    ArrayList<String> tasks = (ArrayList<String>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Lista de Tarefas - To-Do List</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px; }
        .container { max-width: 500px; margin: auto; background: #fff; padding: 20px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1 { text-align: center; color: #333; }
        ul { list-style-type: none; padding: 0; }
        li { background: #f9f9f9; padding: 10px; margin-bottom: 10px; border-left: 5px solid #28a745; border-radius: 3px; }
        .voltar { text-align: center; margin-top: 20px; }
        .voltar a { text-decoration: none; background-color: #007BFF; padding: 10px 20px; color: #fff; border-radius: 5px; font-size: 16px; }
        .voltar a:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Lista de Tarefas</h1>
        <ul>
            <% for (String task : tasks) { %>
                <li><%= task %></li>
            <% } %>
        </ul>
        <div class="voltar">
            <a href="index.jsp">Voltar</a>
        </div>
    </div>
</body>
</html>
