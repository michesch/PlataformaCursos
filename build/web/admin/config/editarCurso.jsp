<%@ page import="java.io.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@ page import= "util.Upload" %>

 
<%
 
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String id = request.getParameter("id");
    String nameImg = request.getParameter("imagem");
    Upload up = new Upload();
    up.setFolderUpload("arquivos");
 
 
    if(up.formProcess(getServletContext(), request)) {
 
        String imagem = up.getFiles().get(0);
        String nome = up.getForm().get("name").toString();
        String desc = up.getForm().get("descr").toString();
        Float valor = Float.parseFloat(up.getForm().get("valor").toString());
 
        String url = "jdbc:postgresql://localhost:5432/plataforma";
        String usuario = "postgres";
        String senhaBD = "admin";
 
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, usuario, senhaBD);
            st = con.createStatement();
            st.executeUpdate("UPDATE curso set name = '"+nome+"', descr = '"+desc+"', imagem= '"+imagem+"', valor = '"+valor+"' WHERE id = '"+id+"' ");
 
            File file = new File("C:\\Users\\miche\\Documents\\Cursos\\michelle_java_noturno\\FRAMEWORK\\PlataformaCursos\\web\\arquivos"+nameImg);
            file.delete();
 
            response.sendRedirect("../cursos.jsp?status=2"); //Atualizado com sucesso.
        } catch (Exception e) {
            out.print(e);
        }
 
    }
 
%>