<%
        session.invalidate();
        response.sendRedirect("../index.jsp?erro=4"); //Redireciona para login -> msg sessão encerrada
%>


7