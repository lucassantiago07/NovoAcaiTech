<%-- 
    Document   : alterarCliente
    Created on : 01/11/2018, 19:12:44
    Author     : Fernando Lima Coutinho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>AçaiTech - Alterar Clientes</title>
        <link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/js/validanumero.js"></script>
    </head>
    <!-- Inicio Menu -->
    <nav class="navbar navbar-light bg-light">
        <div class="corpoimagem">
            <img src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo">
        </div>
        <div class="informacoessobrefuncionario">
            <span class="nomedofuncionario">Fulano de Tal</span> ●
            <span class="filialfuncionario">Filial Amazonia</span>  ●
            <span><a href="#">Sair</a></span>
        </div>
        <button type="button" class="btn btn-primary btnSair" onclick="window.location.href = '${pageContext.request.contextPath}'">Sair</button>
    </nav>
    <!-- Fim Menu -->
    <body>
        <!-- Inicio Carrocel -->
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="2500">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/img/aviso1.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/img/aviso2.jpg" alt="Second slide">
                </div>
                <div class="carousel-item" >
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/img/aviso3.jpg" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- Fim Carrocel -->

        <!-- Inicio Separador -->
        <nav class="navbar navbar-light separadorcarrocel">

        </nav>
        <!-- Fim Separador -->

        <!-- Inicio Corpo De Campo -->
        <div class="container corpodecampos">

            <h3>Alterar Cliente</h3>

            <form name="formularioCliente" id="formularioCliente" action="${pageContext.request.contextPath}/alterarCliente" method="post">
                
                <div class="form-group">
                    <label>Nome</label>
                    <input class="form-control" id="nomeCliente" name="nomeCliente" maxlength="20" required></input>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input class="form-control" id="emailCliente" name="emailCliente" maxlength="20" required></input>
                </div>
                <div class="form-group">
                    <label>CPF</label>
                    <input type="text" class="form-control" id="cpfCliente" name="cpfCliente" onkeypress="return isNumberKey(event)" maxlength="5" required></input>
                </div>
                <div class="form-group">
                    <label>Endereço</label>
                    <input class="form-control" id="enderecoCliente" name="enderecoCliente" maxlength="20" required></input>
                </div>
                <div class="form-group">
                    <label>CEP</label>
                    <input type="text" class="form-control" id="cepCliente" name="cepCliente" onkeypress="return isNumberKey(event)" maxlength="5" required></input>
                </div>
                <div class="form-group">
                    <label>Telefone</label>
                    <input type="text" class="form-control" id="telefoneCliente" name="telefoneCliente" onkeypress="return isNumberKey(event)" maxlength="5" required></input>
                </div>
                
                <div class="form-group">
                    <label>Celular</label>
                    <input type="text" class="form-control" id="celularCliente" name="celularCliente" onkeypress="return isNumberKey(event)" maxlength="5" required></input>
                </div>
                
                
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>

            <c:if test="${not empty retorno}">
                <script type="text/javascript">
                    alert("Cliente cadastrado!");
                    window.location.href = '${pageContext.request.contextPath}/view/listaCliente.jsp'
                </script>
            </c:if>  
        </div>
        <!-- Fim Corpo De Campo -->
            
        <!-- Inicio Footer -->
        <footer class="rodape page-footer font-small blue">
            <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]
                <a class="suporte" href="#"> Solicitar Suporte  <img class="imagemsuporte" src="${pageContext.request.contextPath}/img/suporte.png"></a>
            </div>
        </footer>
        <!-- Fim Footer -->
        
        <link type="text/css" href="${pageContext.request.contextPath}/css/script.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/alterarCliente.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/menu.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/gradiente.js"></script>
    </body>
</html>