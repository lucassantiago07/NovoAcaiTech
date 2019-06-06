<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .box {
                cursor: pointer;
                height: 250px;
                position: relative;
                overflow: hidden;
                width: 300px;
            }
            .box img {
                position: absolute;
                left: 0;
                -webkit-transition: all 300ms ease-out;
                -moz-transition: all 300ms ease-out;
                -o-transition: all 300ms ease-out;
                -ms-transition: all 300ms ease-out;
                transition: all 300ms ease-out;
            }
            .box .overbox {
                background-color: #304562;
                position: absolute;
                top: 0;
                left: 0;
                color: #fff;
                z-index: 100;
                -webkit-transition: all 300ms ease-out;
                -moz-transition: all 300ms ease-out;
                -o-transition: all 300ms ease-out;
                -ms-transition: all 300ms ease-out;
                transition: all 300ms ease-out;
                opacity: 0;
                width: 300px;
                height: 250px;
                padding: 13px 20px;
            }
            .box:hover .overbox { opacity: 1; }
            .box .overtext {
                -webkit-transition: all 300ms ease-out;
                -moz-transition: all 300ms ease-out;
                -o-transition: all 300ms ease-out;
                -ms-transition: all 300ms ease-out;
                transition: all 300ms ease-out;
                transform: translateY(40px);
                -webkit-transform: translateY(40px);
            }
            .box .title {
                font-size: 2.5em;
                text-transform: uppercase;
                opacity: 0;
                transition-delay: 0.1s;
                transition-duration: 0.2s;
            }
            .box:hover .title,
            .box:focus .title {
                opacity: 1;
                transform: translateY(0px);
                -webkit-transform: translateY(0px);
            }
            .box .tagline {
                font-size: 0.8em;
                opacity: 0;
                transition-delay: 0.2s;
                transition-duration: 0.2s;
            }
            .box:hover .tagline,
            .box:focus .tagline {
                opacity: 1;
                transform: translateX(0px);
                -webkit-transform: translateX(0px);
            }
        </style>
        <link href="http://www.cssscript.com/wp-includes/css/sticky.css" rel="stylesheet" type="text/css">
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-46156385-1', 'cssscript.com');
            ga('send', 'pageview');

        </script>
        
        <!-- temporario -->

        <meta charset="UTF-8">
        <title>AcaiTech Sistema - Index</title>
        <link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    </head>
    <body>
        <!-- Inicio Menu -->
        
        <nav class="navbar navbar-light bg-light">
            <div class="corpoimagem">
                <a href="${pageContext.request.contextPath}/view/destaques.jsp"><img  src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo"></a>
            </div>
            
             <div class="menu-desktop">
						<ul class="main-menu">
							<li class="active-menu">
								<a href="destaques.jsp">Home</a>
								
							</li>
                                                        
                                                                         												
						</ul>
				</div>
            
            <div class="menu-desktop">
						<ul class="main-menu">
							                                                        
                                                        <li>
                                                                <a href="institucional.jsp">Institucional</a>
                                                        </li>

                     												
						</ul>
				</div>
            
             <div class="menu-desktop">
						<ul class="main-menu">
							                                                        
                                                        <li>
                                                                <a href="listaProduto.jsp">Gerenciamento de Produtos</a>
                                                        </li>

                     												
						</ul>
				</div>
            
             <div class="menu-desktop">
						<ul class="main-menu">
							                                                        
                                                        <li>
                                                                <a href="relatorio.jsp">Relatórios</a>
                                                        </li>

                     												
						</ul>
				</div>
            
             <div class="menu-desktop">
						<ul class="main-menu">
							                                                        
                                                        <li>
                                                                <a href="listaCliente.jsp">Meus Dados</a>
                                                        </li>

                     												
						</ul>
				</div>
            
            
            
            <form action="${pageContext.request.contextPath}/sairLogin" method="post">
                
                 <a style="color:white;" href="${pageContext.request.contextPath}/view/cadastrarCliente.jsp">
                    <button type="button" class="btn btn-primary" >Faça cadastro ou Login</button>
                </a>
                
                    <c:if test="${empty sessionScope.getNome}">
                        <a style="color:white;" href="${pageContext.request.contextPath}/view/login.jsp">
                            <button type="button" class="btn btn-primary" >Carrinho</button>
                        </a>
                    </c:if>
                 <c:if test="${sessionScope.getNome != null}">
                    <a style="color:white;" href="${pageContext.request.contextPath}/view/carrinho.jsp">
                        <button type="button" class="btn btn-primary" >Carrinho</button>
                    </a>
                 </c:if>
                    
                
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
            <b></b><div class="col-12 removedordefiltro" style="visibility:hidden;text-align: center;color:white;font-size: 1em;margin-top: 1%;"><a href="${pageContext.request.contextPath}/view/destaques.jsp" style="text-align: center;color:white;">Remover Filtro</a></div>
        </nav>
        <!-- Fim Busca Jogos -->
        <div class=" corpodeprodutos container"><br>
           
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
            
            <c:if test="${not empty retorno}">
            <script type="text/javascript">
                        $("#myModal").modal();
                        $('#myModal').on('hidden.bs.modal', function () {
                            window.location.href = '${pageContext.request.contextPath}/view/destaques.jsp'
                        })
            </script>
        </c:if> 
    </body>