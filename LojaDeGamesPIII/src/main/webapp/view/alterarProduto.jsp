<%-- 
   Document   : alterarProduto
   Created on : 16/10/2018, 09:22:17
   Author     : angelo.xavier
   --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta charset="UTF-8">
      <title>AcaiTech Sistema - Alterar Produtos</title>
      <link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
      <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
      <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
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
      <button type="button" class="btn btn-primary btnSair">Sair</button>
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
          
          <h3>Alterar Produto</h3>
          
      <form>
         
         <div class="form-group">
            <label>Nome do Produto</label>
            <input class="form-control" id="nomeProduto" name="nomeProduto"></input>
         </div>
         <div class="form-group">
            <label>Preço De Venda</label>
            <input class="form-control" id="precoVenda" name="precoVenda"></input>
         </div>
         <div class="form-group">
            <label>Preço De Custo</label>
            <input class="form-control" id="precoCusto" name="precoCusto"></input>
         </div>
         <div class="form-group">
            <label>Fornecedor</label>
            <input class="form-control" id="fornecedor" name="fornecedor"></input>
         </div>
         <div class="form-group">
            <label>Categoria</label>
            <select class="form-control" id="categoria" name="categoria">
               <option>1</option>
               <option>2</option>
               <option>3</option>
               <option>4</option>
               <option>5</option>
            </select>
         </div>
         <div class="form-group">
            <label>Quantidade</label>
            <input class="form-control" id="quantidade" name="quantidade"></input>
         </div>
                      <div class="form-group">
            <label>Descrição</label>
            <textarea class="form-control" id="descricao" name="descricao"></textarea>
         </div>
          <button type="button" class="btn btn-primary" href="#">Voltar</button>
           <button type="submit" class="btn btn-primary">Enviar</button>
      </form>
          </div>
          
     
      <!-- Inicio Footer -->
      <footer class="rodape page-footer font-small blue">
         <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]
            <a class="suporte" href="#"> Solicitar Suporte  <img class="imagemsuporte" src="${pageContext.request.contextPath}/img/suporte.png"></a>
         </div>
      </footer>
      <!-- Fim Footer -->
      
      
      <link type="text/css" href="${pageContext.request.contextPath}/css/script.css" rel="stylesheet" />
      <link type="text/css" href="${pageContext.request.contextPath}/css/alterarProduto.css" rel="stylesheet" />
      <link type="text/css" href="${pageContext.request.contextPath}/css/menu.css" rel="stylesheet" />
      <script src="${pageContext.request.contextPath}/js/gradiente.js"></script>
   </body>
</html>