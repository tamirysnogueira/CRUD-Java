<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/pagInserir.css">
    <title>Document</title>
</head>
<body>
    <main>
        <section id="account">
            <h1>Boas vindas ao <strong>FlahsBus!</strong></h1>

        </section>

        <section id="form">
            <h2>Insira suas informações para se cadastrar sua viagem:</h2>

            <form action="processar.jsp" method="GET" >
                <div id="containerInputsText">
                    <div>
                        <label for="nome">Nome</label>
                        <input type="text" name="nome" id="name"  maxlength="45" class="input">
                        
                        <span></span>
                    </div>
                    
                    <div>
                        <label for="email">E-mail</label>
                        <input type="email" name="email" id="email"  class="input" >
                        
                        <span></span>
                    </div>
                    
                    <div>
                        <label for="cpf">CPF</label>
                        <input type="text" name="cpf" id="cpf"  maxlength="11" class="input">
                        
                        <span></span>
                    </div>
    
                    <div>
                        <label for="telefone">Telefone</label>
                        <input type="text" id="tel" name="telefone"  maxlength="25" class="input">
                       
                        <span></span>
                    </div>

                    <div>
                        <label for="data">Selecione a data de sua ida</label>
                        <input type="date" name="data" id="data" class="input">
                        
                        <span></span>
                    </div>

                    <div>
                        <label for="local">Local de sua ida</label>
                        <input type="text" name="local" id="local" class="input">
                        
                        <span></span>
                    </div>
                    
                    <div>
                        <label for="valor">Valor da sua passagem</label>
                        <input type="number" name="valor" id="valor" class="input" step=".1">
                        
                        <span></span>
                    </div>
                </div>
                
                	<div id="containerButton">
                    	<button type="submit" name="btnOperacao" id="button" value="Inserir">Reservar a passagem do cliente</button>
                    	<button type="submit" name="btnOperacao" id="button" value="Selecionar">Abrir reservas de clientes</button>
                	</div>
                
                
            </form>
        </section>
    </main>


    
</body>
</html>