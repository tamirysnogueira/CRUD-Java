<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.Connection" %>   
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>   

<%
		String banco, usuario, senha;
		
		Connection conexaoBD = null;
		PreparedStatement cmdSQL = null;
		ResultSet rsCliente = null;
		
		//---------------------------------------
		// Conex�o com o banco de dados
		//---------------------------------------
		try{
			banco="jdbc:mysql://localhost/projetofinal";
			usuario="root";
			senha = "";
			
			Class.forName("com.mysql.jdbc.Driver");
			
			conexaoBD = DriverManager.getConnection(banco, usuario, senha);
			
			
		}
		catch(Exception ex){
			out.println("<h3>Erro: " + ex.getMessage()  + "</h3>");
			return;
		}
		
		//------------------------------
		//Selecionar
		//------------------------------
		
		
		try{
		
			cmdSQL = conexaoBD.prepareStatement("Select * From passagemcliente");
			
			rsCliente = cmdSQL.executeQuery();
			
		
		}
		catch(Exception ex){
			out.println("<h3>Erro: " + ex.getMessage()  + "</h3>");
			return;
		}	
	
	%>   
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/selecionar.css">

</head>
<body>
	

	<h1>Selecionar Cliente</h1>
	<hr><br>
	
	<form action="processar.jsp" method="GET">
			<table>
				<tr id="info">
					<td> ID </td>
					<td> Nome </td>
					<td> E-mail </td>
					<td> CPF </td>
					<td> Telefone </td>
					<td> Data de ida </td>
					<td> Local da ida </td>
					<td> Valor da passagem </td>
				</tr>
				
				<%
				
				if(rsCliente.next()){
					do{
						int idpassagemCliente;
						String nome, cpf, telefone,local,email, data;
						float valorPassagem;
						
						idpassagemCliente = rsCliente.getInt("idpassagemCliente");
						nome = rsCliente.getString("nome");
						cpf = rsCliente.getString("cpf");
						telefone = rsCliente.getString("telefone");
						local = rsCliente.getString("local");
						email = rsCliente.getString("email");
						data = rsCliente.getString("data");
						valorPassagem = rsCliente.getFloat("valor");
						
						out.println("<tr id='valores'>");
							out.println("<td> " + idpassagemCliente + " </td>");
							out.println("<td> " + nome + " </td>");
							out.println("<td> " + telefone + " </td>");
							out.println("<td> " + local + " </td>");
							out.println("<td> " + email + " </td>");
							out.println("<td> " + data + " </td>");
							out.println("<td> " + valorPassagem + " </td>");
							out.println("<td> <a href='alterar.jsp?idCliente=" + idpassagemCliente + "'> Alterar </a></td>");
							out.println("<td> <a href='excluir.jsp?idCliente=" + idpassagemCliente + "'> Excluir </a> </td>");
						out.println("</tr>");
						
					}while(rsCliente.next());			
				} else{
					
					out.println("<h3>Nenhuma informação encontrada!</h3>");
				}
				
					
				
				%>
				
			</table>
			
			<p><br>
		<button type="submit" name="btnOperacao" id="button" value="Voltar">Voltar</button>
		</p>
		
	
		
	</form>
	
	
</body>
</html>