<%@ page import= "java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>

<%
    Connection con = null;
    Statement st = null; //instanciando Statement para executar QUERYS
    ResultSet rs = null; //instanciando ResultSet´para navegar entre retornados
    
    String email = request.getParameter("email"); //Armazenando na variável (name) e-mail o que foi digitado no form de login
    String senha = request.getParameter("pass"); //Armazenando na variável (name)  senha o que foi digitado no form de login
    String user = null;
    String pass = "";
    String NomeUser = "";
    
    if(email == "" || senha == ""){ //Verifica se possui campos em branco
        response.sendRedirect("../index.jsp?erro=1");  //Retorna para o login com erro = 1 -> campos em branco
    }else{
        try{
            String url = "jdbc:postgresql://localhost:5432/plataforma";
            String usuarios = "postgres";
            String senhaBD = "admin";          
            
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url,usuarios,senhaBD);
            st = con.createStatement();
            rs = st.executeQuery("SELECT *FROM usuario WHERE email = '"+email+"' AND pass = '"+senha+"'");
            while (rs.next()){
            user = rs.getString(3); //armazenando email
            pass = rs.getString(4); // armazenando senha
            NomeUser = rs.getString(2); //armazenando senha
            }
            
        }catch (Exception e){
            out.print(e);
        }
        
        if(email.equals(user) && senha.equals (pass)){
            session.setAttribute("NomeUsuario", NomeUser);
            response.sendRedirect("../home.jsp");
        }else{
            response.sendRedirect("../index.jsp?erro=2"); //usuario ou senha invalidos
        }
    }
%>