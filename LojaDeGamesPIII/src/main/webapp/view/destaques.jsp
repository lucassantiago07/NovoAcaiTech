<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <c:if test="${empty sessionScope.getNome}">
            <c:redirect url = "/expulsarDaPaginaSemLogar"/>
        </c:if>
        <jsp:include page="/listaProduto" />
        <meta charset="UTF-8">
        <title>AcaiTech Sistema - Destaques</title>
        <link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    </head>
    <body>
        <!-- Inicio Menu -->
        <nav class="navbar navbar-light bg-light">
            <div class="corpoimagem">
                <a href="${pageContext.request.contextPath}/view/index.jsp"><img  src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo"></a>
            </div>
            <div class="informacoessobrefuncionario">
                <span class="nomedofuncionario">${sessionScope.getNome}</span> ●
                <span class="filialfuncionario">${sessionScope.getFilial}</span>  ●
                <span class="cargofuncionario">${sessionScope.getCargo}</span>  ●
                <span class="datafuncionario">${sessionScope.getData}</span>  
            </div>
            <form action="${pageContext.request.contextPath}/sairLogin" method="post">
                <a style="color:white;" href="${pageContext.request.contextPath}/view/carrinho.jsp">
                    <button type="button" class="btn btn-primary" >Carrinho</button>
                </a>
                <button type="submit" class="btn btn-primary btnSair">Sair</button>
            </form>
        </nav>
        <!-- Fim Menu -->
        <!-- Inicio Carrocel -->
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="2500">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/img/slide1.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/img/slide2.jpg" alt="Second slide">
                </div>
                <div class="carousel-item" >
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/img/slide3.jpg" alt="Third slide">
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
            <form class="form-inline buscajogos" method="post" action="${pageContext.request.contextPath}/capturaPorBusca">
                <input name="jogo" class=" form-control mr-sm-2 " type="search" placeholder="Digite o nome do jogo,fornecedor, ano de lançamento, plataforma, ..etc" aria-label="Search" style="width:90%">
                <button type="submit" class="btn btn-light">Buscar</button>
            </form></br>
            <b></b><div class="col-12 removedordefiltro" style="visibility:hidden;text-align: center;color:white;font-size: 0.5em;margin-top: 1%;"><a href="${pageContext.request.contextPath}/view/destaques.jsp" style="text-align: center;color:white;">Remover Filtro</a></div>
        </nav>
        <!-- Fim Busca Jogos -->
        <div class=" corpodeprodutos container">
            <div class="destaque">
                <img src="${pageContext.request.contextPath}/img/destaque.png"  class="imagemdestaque">
            </div>
            <div class="row">
                <c:if test="${ not empty lista}">
                    <c:forEach var="produto" items="${lista}">
                        <div class="card">
                            <a href="${pageContext.request.contextPath}/view/exibeProduto.jsp?idProduto=?${produto.id}">
                                <img class="card-img-top" src="${pageContext.request.contextPath}/img/${produto.categoria}.png">
                            </a>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/view/exibeProduto.jsp?idProduto=?${produto.id}">
                                    <h5 class="card-title">${produto.nome}</h5>
                                </a>
                                <p style="color:black;" class="card-text descricoes">${produto.descricao}</p>
                                <p class="card-text">  

                                <h5>
                                    R$: ${produto.precoDeVenda}
                                </h5>
                                </p>
                                Categoria:
                                <c:if test="${produto.categoria == 1}">
                                    <p>Ação</p>
                                </c:if>
                                <c:if test="${produto.categoria == 2}">
                                    <p>Corrida</p>
                                </c:if>
                                <c:if test="${produto.categoria == 3}">
                                    <p>Tiro</p>
                                </c:if>
                                <c:if test="${produto.categoria == 4}">
                                    <p>RPG</p>
                                </c:if>
                                <c:if test="${produto.categoria == 5}">
                                    <p>Estratégia</p>
                                </c:if>
                                <c:if test="${produto.categoria == ''}">
                                    <p>Não encontrado</p>
                                </c:if>
                                <div class="addCarrinhoDiv">    
                                    <img  src="${pageContext.request.contextPath}/img/carrinho.png"  class="imagemstar">
                                    <a style="color:white;" href="${pageContext.request.contextPath}/adicionarAoCarrinho?idProduto=${produto.id}">Add. Carrinho</a> 
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        <!-- Footer -->
        <footer class="rodape page-footer font-small blue">
            <!-- Copyright -->
            <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]
                <a class="suporte" href="#"> Solicitar Suporte  <img class="imagemsuporte" src="${pageContext.request.contextPath}/img/suporte.png"></a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
        <link type="text/css" href="${pageContext.request.contextPath}/css/script.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/destaques.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/menu.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/gradiente.js"></script>

        <c:if test="${not empty filtro}">
            <script type="text/javascript">
                $(".removedordefiltro").css('visibility', 'visible')
            </script>
        </c:if>  
    </body>
</html>