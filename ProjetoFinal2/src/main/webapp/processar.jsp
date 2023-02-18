<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.Connection" %>   
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %> 

  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

<%
	String operacao;
	operacao = request.getParameter("btnOperacao");
	
	String banco, usuario, senha;
	
	Connection conexaoBD = null;
	PreparedStatement cmdSQL = null;
	ResultSet rsCliente = null;
	
	int idpassagemCliente;
	String nome, cpf, telefone,local,email, data;
	float valorPassagem;
	
	//---------------------------------------
	// Conex�o com o banco de dados
	//---------------------------------------
	try{
		banco="jdbc:mysql://localhost/projetofinal";
		usuario="root";
		senha = "";
		
		Class.forName("com.mysql.jdbc.Driver");
		
		conexaoBD = DriverManager.getConnection(banco, usuario, senha);
		
		out.println("<h3>Conexão efetuada com sucesso!</h3>");
		
	}
	catch(Exception ex){
		out.println("<h3>Erro: " + ex.getMessage()  + "</h3>");
		return;
	}
	
	//---------------------------------------
	// Operações de SQL
	//---------------------------------------
	
	if(operacao.equals("Inserir")){
		try{
			
			
			nome = request.getParameter("nome");
			cpf = request.getParameter("cpf");
			telefone = request.getParameter("telefone");
			local = request.getParameter("local");
			email = request.getParameter("email");
			data = request.getParameter("data");
			String valorPassagemTxt = request.getParameter("valor");
			valorPassagem = Float.parseFloat(valorPassagemTxt);
			
			
			cmdSQL = conexaoBD.prepareStatement("Insert into passagemcliente(nome, cpf, telefone, local, email, data, valor) values('" + nome + "', '" + cpf + "', '" + telefone + "', '" + local + "','" + email + "', '" + data + "', "+ valorPassagem +")");
					
			cmdSQL.executeUpdate();
			
			response.sendRedirect("selecionar.jsp");
			
		}
		catch(Exception ex){
			out.println("<h3>Erro: " + ex.getMessage()  + "</h3>");
			return;
		}	
	} else if(operacao.equals("Selecionar")){
		response.sendRedirect("selecionar.jsp");
		
	} else if(operacao.equals("Alterar")){
		try{
			String strIdCliente = request.getParameter("id");
			
			nome = request.getParameter("nome");
			cpf = request.getParameter("cpf");
			telefone = request.getParameter("telefone");
			local = request.getParameter("local");
			email = request.getParameter("email");
			data = request.getParameter("data");
			String valorPassagemTxt = request.getParameter("valor");
			valorPassagem = Float.parseFloat(valorPassagemTxt);
			
			
			cmdSQL = conexaoBD.prepareStatement("Update passagemcliente Set nome='" + nome + "', cpf='" + cpf + "', telefone='" + telefone + "', local='" + local + "', email='" + email + "', data='" + data + "', valor=" + valorPassagem + " Where idpassagemCliente = " + strIdCliente + " ");
			
			cmdSQL.executeUpdate();
			
			response.sendRedirect("selecionar.jsp");
			
			
		}
		catch(Exception ex){
			out.println("<h3>Erro: " + ex.getMessage()  + "</h3>");
			return;
		}	
		
	}	else if(operacao.equals("Excluir")){
		try{
			String strIdCliente = request.getParameter("id");
			
			idpassagemCliente = Integer.parseInt(strIdCliente);
					
			cmdSQL = conexaoBD.prepareStatement("Delete From passagemcliente Where idpassagemCliente = " + idpassagemCliente);	
			
			cmdSQL.executeUpdate();
			
			response.sendRedirect("selecionar.jsp");
			
			
			
		}
		catch(Exception ex){
			out.println("<h3>Erro: " + ex.getMessage()  + "</h3>");
			return;
		}}
		
		else if(operacao.equals("Voltar")){
		response.sendRedirect("Inserir.jsp");
	}
	
	%> 

</body>
</html>