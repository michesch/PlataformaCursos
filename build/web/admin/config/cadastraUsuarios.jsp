<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>

<% 
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
        st.execute("INSERT INTO usuario (name, email, pass) VALUES( '"+nome+"','"+email+"','"+senha+"') ");
        response.sendRedirect("../usuarios.jsp?status=1");
    }catch(Exception e){
        out.println(e);
    }
%>

