<%
        session.invalidate();
        response.sendRedirect("../index.jsp?erro=4"); //Redireciona para login -> msg sess�o encerrada
%>


7