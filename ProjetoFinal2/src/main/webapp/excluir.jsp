
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>

<%
	String idpassagemCliente = "";
	String nome= "";
	String cpf = "";
	String telefone = "";
	String local = "";
	String email = "";
	String data = "";
	
	float valorPassagem = 0;
	
	idpassagemCliente = request.getParameter("idCliente");
	
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
	
		cmdSQL = conexaoBD.prepareStatement("Select * From passagemcliente Where idpassagemCliente=" + idpassagemCliente);
		
		rsCliente = cmdSQL.executeQuery();
		
		if(rsCliente.next()){
			do{
				
				idpassagemCliente = rsCliente.getString("idpassagemcliente");				
				nome = rsCliente.getString("nome");
				cpf = rsCliente.getString("cpf");
				telefone = rsCliente.getString("telefone");
				local = rsCliente.getString("local");
				email = rsCliente.getString("email");
				data = rsCliente.getString("data");
				valorPassagem = rsCliente.getFloat("valor");
				
				
			}while(rsCliente.next());			
		} else{
			
			out.println("<h3>Nenhuma informação encontrada!</h3>");
		}
		
	
	}
	catch(Exception ex){
		out.println("<h3>Erro: " + ex.getMessage()  + "</h3>");
		return;
	}	



%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/alterar.css">
    </head>
    <body>
    <main>
    	<h1>Excluir Aluno</h1>         
        <hr><br>
        <section id="form">
        	<form action="processar.jsp" method="GET">
            <div id="containerInputsText">
            		<div>
                        <label for="id">ID Cliente</label>
                        <input type="text" name="id" id="id" readonly value="<%=idpassagemCliente %>" required maxlength="45" class="input">
                        
                        <span></span>
                    </div>
                    
                    <div>
                        <label for="nome">Nome</label>
                        <input type="text" name="nome" id="name" readonly value="<%=nome %>" required maxlength="45" class="input">
                        
                        <span></span>
                    </div>
                    
                    <div>
                        <label for="email">E-mail</label>
                        <input type="email" name="email" id="email" readonly value="<%=email %>" required class="input" >
                        
                        <span></span>
                    </div>
                    
                    <div>
                        <label for="cpf">CPF</label>
                        <input type="text" name="cpf" id="cpf" readonly value="<%=cpf %>" maxlength="11" class="input">
                        
                        <span></span>
                    </div>
    
                    <div>
                        <label for="telefone">Telefone</label>
                        <input type="text" id="tel" name="telefone" readonly value="<%=telefone %>" required maxlength="25" class="input">
                       
                        <span></span>
                    </div>

                    <div>
                        <label for="data">Selecione a data de sua ida</label>
                        <input type="date" name="data" id="data" class="input" readonly value="<%=data %>" >
                        
                        <span></span>
                    </div>

                    <div>
                        <label for="local">Local de sua ida</label>
                        <input type="text" name="local" id="local" class="input" readonly value="<%=telefone %>" >
                        
                        <span></span>
                    </div>
                    
                    <div>
                        <label for="valor">Valor da sua passagem</label>
                        <input type="number" name="valor" id="valor" class="input" readonly step=".1" value="<%=valorPassagem %>">
                        
                        <span></span>
                    </div>
                </div>
            
                 
                               
            <hr>
            
            <input type="submit" name="btnOperacao" value="Excluir" id="voltar" />  
         	<input type="submit" name="btnOperacao" value="Voltar" id="voltar" /> 
        </form>
        
        
        </section>
        
       
    	</main>
    </body>
</html>
