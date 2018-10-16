<%-- 
    Document   : destaques
    Created on : 14/10/2018, 12:06:26
    Author     : angelo.xavier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>AcaiTech Sistema - Destaques</title>
      <link type="text/css" href="css/bootstrap.css" rel="stylesheet" />
      <script src="js/jquery-3.3.1.js"></script>
      <script src="js/bootstrap.js"></script>
   </head>
   <body>
      <!-- Inicio Menu -->
      <nav class="navbar navbar-light bg-light">
         <div class="corpoimagem">
            <img src="img/logo.png"  class="imagemlogo">
         </div>
         <div class="informacoessobrefuncionario">
            <span class="nomedofuncionario">Fulano de Tal</span> ●
            <span class="filialfuncionario">Filial Amazonia</span>  ●
            <span><a href="#">Sair</a></span>
         </div>
         <button type="button" class="btn btn-primary btnCarrinho">Carrinho <img src="img/carrinho.png"  class="imagemcarrinho"></button>
      </nav>
      <!-- Fim Menu -->
      <!-- Inicio Carrocel -->
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="2500">
         <div class="carousel-inner">
            <div class="carousel-item active">
               <img class="d-block w-100" src="img/slide1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
               <img class="d-block w-100" src="img/slide2.jpg" alt="Second slide">
            </div>
            <div class="carousel-item" >
               <img class="d-block w-100" src="img/slide3.jpg" alt="Third slide">
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
      <!-- Inicio Busca Jogos -->
      <nav class="buscar navbar navbar-light" style="background-color: purple;">
         <form class="form-inline buscajogos">
            <input class=" form-control mr-sm-2 " type="search" placeholder="Digite o nome do jogo,fornecedor, ano de lançamento, plataforma, ..etc" aria-label="Search" style="width:90%">
            <button type="submit" class="btn btn-light">Buscar</button>
         </form>
         
      </nav>
		<!--
	  <div class="row filtros">
	  <div class="plataforma">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Plataforma<span class="caret"></span></button>
            <ul class="dropdown-menu">
               <li class="dropdown-header">Dropdown header 1</li>
               <li class="itemdelista"><a href="#">Xbox 360</a></li>
			   <li class="itemdelista"><a href="#">Xbox ONE</a></li>
               <li class="itemdelista"><a href="#">PlayStation 2</a></li>
               <li class="itemdelista"><a href="#">PlayStation 3</a></li>
			   <li class="itemdelista"><a href="#">PlayStation 4</a></li>
			   <li class="itemdelista"><a href="#">Nintendo  Wii</a></li>
			   <li class="itemdelista"><a href="#">Nintendo  3DS </a></li>			   
			   <li class="itemdelista"><a href="#">Computador</a></li>
            </ul>
         </div>
		 <div class="categoriadojogo">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Categoria do jogo<span class="caret"></span></button>
            <ul class="dropdown-menu">
               <li class="dropdown-header">Dropdown header 1</li>
               <li class="itemdelista"><a href="#">Ação</a></li>
			   <li class="itemdelista"><a href="#">Corrida</a></li>
               <li class="itemdelista"><a href="#">RPG</a></li>
               <li class="itemdelista"><a href="#"></a></li>
			   <li class="itemdelista"><a href="#"></a></li>
			   <li class="itemdelista"><a href="#"></a></li>
			   <li class="itemdelista"><a href="#"></a></li>			   
			   <li class="itemdelista"><a href="#"></a></li>
            </ul>
         </div>
		 		 <div class="anodelancamento">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Ano de lançamento<span class="caret"></span></button>
            <ul class="dropdown-menu">
               <li class="dropdown-header">Dropdown header 1</li>
               <li class="itemdelista"><a href="#">2010</a></li>
			   <li class="itemdelista"><a href="#">2009</a></li>
               <li class="itemdelista"><a href="#">2005</a></li>
               <li class="itemdelista"><a href="#"></a></li>
			   <li class="itemdelista"><a href="#"></a></li>
			   <li class="itemdelista"><a href="#"></a></li>
			   <li class="itemdelista"><a href="#"></a></li>			   
			   <li class="itemdelista"><a href="#"></a></li>
            </ul>
         </div>
		 </div>-->
		 
	  
      <!-- Fim Busca Jogos -->
      <div class=" corpodeprodutos container">
         <!-- Inicio Imagem Busca -->
         <div class="destaque">
            <img src="img/destaque.png"  class="imagemdestaque">
            <!--<img src="img/star.png"  class="imagemestrela">
               <img src="img/star.png"  class="imagemestrela">
               <img src="img/star.png"  class="imagemestrela">
               <img src="img/star.png"  class="imagemestrela">
               <img src="img/star.png"  class="imagemestrela">-->
         </div>
         <!-- Fim Imagem Busca -->
         <!-- Inicio Produtos -->
         <div class="row">
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
            <div class="card">
               <img class="card-img-top" src="img/produto.jpg" alt="Card image cap">
               <div class="card-body">
                  <h5 class="card-title">Titulo do Jogo</h5>
                  <p class="card-text">Texto explicativo do jogo...</p>
                  <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
               </div>
            </div>
         </div>
         <!-- Fim Produtos -->
      </div>
      <!-- Footer -->
      <footer class="rodape page-footer font-small blue">
         <!-- Copyright -->
         <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]
            <a class="suporte" href="#"> Solicitar Suporte  <img class="imagemsuporte" src="img/suporte.png"></a>
         </div>
         <!-- Copyright -->
      </footer>
      <!-- Footer -->
      <link type="text/css" href="css/script.css" rel="stylesheet" />
      <link type="text/css" href="css/destaques.css" rel="stylesheet" />
	  <link type="text/css" href="css/menu.css" rel="stylesheet" />
      <script src="js/gradiente.js"></script>
   </body>