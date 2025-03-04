<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Recupera ou cria a lista de tarefas na sessão
    ArrayList<String> tasks = (ArrayList<String>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }

    // Variável para exibir mensagem de sucesso
    String message = "";

    // Se o formulário for enviado via POST, adiciona a nova tarefa
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String newTask = request.getParameter("task");
        if (newTask != null && !newTask.trim().isEmpty()) {
            tasks.add(newTask.trim());
            response.sendRedirect("index.jsp"); // Evita reenvio do formulário
            return;
        }
    }
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>To-Do List - Adicionar Tarefa</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px; }
        .container { max-width: 500px; margin: auto; background: #fff; padding: 20px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1 { text-align: center; color: #333; }
        .input-group { display: flex; margin-bottom: 20px; }
        input[type="text"] { flex: 1; padding: 10px; border: 2px solid #ddd; border-radius: 5px; font-size: 16px; }
        button { padding: 10px; margin-left: 10px; background-color: #28a745; color: #fff; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; }
        button:hover { background-color: #218838; }
        .message { text-align: center; color: #28a745; font-weight: bold; margin-bottom: 20px; }
        .finalizar { text-align: center; margin-top: 20px; }
        .finalizar a { text-decoration: none; background-color: #007BFF; color: #fff; padding: 10px 20px; border-radius: 5px; font-size: 16px; }
        .finalizar a:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <h1>To-Do List</h1>
        <% if (!message.isEmpty()) { %>
            <p class="message"><%= message %></p>
        <% } %>
        <form action="index.jsp" method="post">
            <div class="input-group">
                <input type="text" name="task" placeholder="Digite sua tarefa" required>
                <button type="submit">Adicionar</button>
            </div>
        </form>
        <div class="finalizar">
            <a href="todo.jsp">Finalizar</a>
        </div>
    </div>
</body>
</html>
