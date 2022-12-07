<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>

<%  String id = request.getParameter("id");
    String nome = request.getParameter("name");
    String email = request.getParameter("email");  
    String senha = request.getParameter("pass");
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
   
    String url = "jdbc:postgresql://localhost:5432/plataforma";
    String usuario = "postgres";
    String senhaBD = "admin";
    
    try{
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url,usuario,senhaBD);
        st = con.createStatement();
        st.executeUpdate("update usuario set name = '"+nome+"', email= '"+email+"', pass= '"+senha+"' WHERE id = '"+id+"'");
        response.sendRedirect("../usuarios.jsp?status=2"); // registro atualizado com sucesso
    }catch(Exception e){
        out.println(e);
    }
%>

