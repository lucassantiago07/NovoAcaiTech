<%-- 
    Document   : produtos
    Created on : 14/10/2018, 12:07:28
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
         <button type="button" class="btn btn-primary btnSair">Sair</button>
      </nav>
      <!-- Fim Menu -->
      <!-- Inicio Carrocel -->
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="2500">
         <div class="carousel-inner">
            <div class="carousel-item active">
               <img class="d-block w-100" src="img/aviso1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
               <img class="d-block w-100" src="img/aviso2.jpg" alt="Second slide">
            </div>
            <div class="carousel-item" >
               <img class="d-block w-100" src="img/aviso3.jpg" alt="Third slide">
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
      <!-- Inicio Menu -->
      <nav class="navbar  navbarbotoes">
         <button type="button" class="btn btn-primary btnProdutos">Produtos</button>
         <button type="button" class="btn btn-primary btnClientes">Clientes</button>
      </nav>
      <!-- Fim Menu -->
      <!-- inicio Busca jogos estoque -->
      <div class="buscajogoscorpo">
         <h3>Estoque Atual</h3>
         <form class="form-inline buscajogos">
            <input class=" form-control mr-sm-2 " type="search" placeholder="Digite o nome do jogo,fornecedor, ano de lançamento, plataforma, ..etc" aria-label="Search" style="width:90%">
            <button type="submit" class="btn btn-light">Buscar</button>
         </form>
      </div>
      <!-- fim Busca jogos estoque-->
      <!-- Fim Carrocel -->
      <div class="container">
         <table class="table table-striped">
            <thead>
               <tr>
                  <th scope="col">Produto</th>
                  <th scope="col">Preço De Venda</th>
                  <th scope="col">Preço De Custo</th>
                  <th scope="col">Fornecedor</th>
                  <th scope="col">Categoria</th>
                  <th scope="col">Quantidade em estoque</th>
                  <th scope="col">Editar</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td>Tomb Raider</td>
                  <td>145,00</td>
                  <td>124,00</td>
                  <td>GAMES BRASIL SA</td>
                  <td>Ação</td>
                  <td>25</td>
                  <td><a href="#">Editar</a></td>
               </tr>
               <tr>
                  <td>Tomb Raider</td>
                  <td>145,00</td>
                  <td>124,00</td>
                  <td>GAMES BRASIL SA</td>
                  <td>Ação</td>
                  <td>25</td>
                  <td><a href="#">Editar</a></td>
               </tr>
               <tr>
                  <td>Tomb Raider</td>
                  <td>145,00</td>
                  <td>124,00</td>
                  <td>GAMES BRASIL SA</td>
                  <td>Ação</td>
                  <td>25</td>
                  <td><a href="#">Editar</a></td>
               </tr>
               <tr>
                  <td>Tomb Raider</td>
                  <td>145,00</td>
                  <td>124,00</td>
                  <td>GAMES BRASIL SA</td>
                  <td>Ação</td>
                  <td>25</td>
                  <td><a href="#">Editar</a></td>
               </tr>
               <tr>
                  <td>Tomb Raider</td>
                  <td>145,00</td>
                  <td>124,00</td>
                  <td>GAMES BRASIL SA</td>
                  <td>Ação</td>
                  <td>25</td>
                  <td><a href="#">Editar</a></td>
               </tr>
               <tr>
                  <td>Tomb Raider</td>
                  <td>145,00</td>
                  <td>124,00</td>
                  <td>GAMES BRASIL SA</td>
                  <td>Ação</td>
                  <td>25</td>
                  <td><a href="#">Editar</a></td>
               </tr>
               <tr>
                  <td>Tomb Raider</td>
                  <td>145,00</td>
                  <td>124,00</td>
                  <td>GAMES BRASIL SA</td>
                  <td>Ação</td>
                  <td>25</td>
                  <td><a href="#">Editar</a></td>
               </tr>
               <tr>
                  <td>Tomb Raider</td>
                  <td>145,00</td>
                  <td>124,00</td>
                  <td>GAMES BRASIL SA</td>
                  <td>Ação</td>
                  <td>25</td>
                  <td><a href="#">Editar</a></td>
               </tr>
               <tr>
                  <td>Tomb Raider</td>
                  <td>145,00</td>
                  <td>124,00</td>
                  <td>GAMES BRASIL SA</td>
                  <td>Ação</td>
                  <td>25</td>
                  <td><a href="#">Editar</a></td>
               </tr>
            </tbody>
         </table>
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
      <link type="text/css" href="css/produtos.css" rel="stylesheet" />
      <link type="text/css" href="css/menu.css" rel="stylesheet" />
      <script src="js/gradiente.js"></script>
   </body>
