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
        <c:if test="${empty sessionScope.getNome}">
            <c:redirect url = "/expulsarDaPaginaSemLogar"/>
        </c:if>
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
                <img href="index.jsp" src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo">
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
        <!-- Inicio Separador -->
        <nav class="navbar navbar-light separadorcarrocel">
        </nav>
        <!-- Fim Separador -->
        <div class="container corpodeopcoesmenusbemvindo">
            <h3>Bem vindo Sr(a): ${sessionScope.getNome}</h3>
            <h6><i>Opções disponiveis:</i></h6>
        </div>
        <div class="container corpodeopcoesmenus">
            <div class="row">
                <a href="${pageContext.request.contextPath}/view/destaques.jsp">
                    <div class="box" style="background-color:black;">
                        <img src="${pageContext.request.contextPath}/img/destaques.png" style="width:100%;margin-left: 2%;margin-top: 8%;">
                        <div class="overbox">
                            <div class="title overtext"> Destaques </div>
                            <div class="tagline overtext"> ... </div>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/view/cadastrarProduto.jsp">
                    <div class="box" style="background-color:red;">
                        <img src="${pageContext.request.contextPath}/img/cadastrarProduto.png" style="width:50%;margin-left: 25%;margin-top: 15%;">
                        <div class="overbox">
                            <div class="title overtext"> Cadastrar um produto </div>
                            <div class="tagline overtext"> Para realizar um cadastro clique aqui. </div>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/view/listaProduto.jsp">
                    <div class="box" style="background-color:yellow;">
                        <img src="${pageContext.request.contextPath}/img/listaProduto.png" style="width:50%;margin-left: 25%;margin-top: 15%;">
                        <div class="overbox">
                            <div class="title overtext"> Gerenciar Produtos </div>
                            <div class="tagline overtext"> Para alterar, excluir ou verificar infos clique aqui. </div>
                        </div>
                    </div>
                </a>

            </div>
            <div class="row">
                <a href="${pageContext.request.contextPath}/view/cadastrarCliente.jsp">
                    <div class="box" style="background-color:orange;">
                        <img src="${pageContext.request.contextPath}/img/cadastrarCliente.png" style="width:50%;margin-left: 25%;margin-top: 15%;">
                        <div class="overbox">
                            <div class="title overtext"> Cadastrar um Cliente </div>
                            <div class="tagline overtext"> Para realizar um cadastro clique aqui. </div>
                        </div>
                    </div>
                </a>


                <a href="${pageContext.request.contextPath}/view/listaCliente.jsp">
                    <div class="box" style="background-color:lawngreen;">
                        <img src="${pageContext.request.contextPath}/img/listaCliente.png" style="width:50%;margin-left: 25%;margin-top: 15%;">
                        <div class="overbox">
                            <div class="title overtext"> Gerenciar Cliente </div>
                            <div class="tagline overtext"> Para alterar, excluir ou verificar infos clique aqui. </div>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/view/cadastrarFuncionario.jsp">
                    <div class="box" style="background-color:purple;">
                        <img src="${pageContext.request.contextPath}/img/cadastrarFuncionario.png" style="width:50%;margin-left: 25%;margin-top: 15%;">
                        <div class="overbox">
                            <div class="title overtext"> Cadastrar um funcionario </div>
                            <div class="tagline overtext"> Para realizar um cadastro clique aqui. </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="${pageContext.request.contextPath}/view/listaFuncionario.jsp">
                    <div class="box" style="background-color:aqua;">
                        <img src="${pageContext.request.contextPath}/img/listaFuncionario.png" style="width:50%;margin-left: 25%;margin-top: 15%;">
                        <div class="overbox">
                            <div class="title overtext"> Gerenciar Funcionario </div>
                            <div class="tagline overtext"> Para alterar, excluir ou verificar infos clique aqui. </div>
                        </div>
                    </div>
                </a>


                <a href="${pageContext.request.contextPath}/view/carrinho.jsp">
                    <div class="box" style="background-color:royalblue;">
                        <img src="${pageContext.request.contextPath}/img/carrinho.png" style="width:50%;margin-left: 25%;margin-top: 15%;">
                        <div class="overbox">
                            <div class="title overtext"> Carrinho </div>
                            <div class="tagline overtext"> Para alterar, excluir ou verificar infos clique aqui. </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <!-- inicio Footer -->
        <footer class="rodape page-footer font-small blue">
            <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]
                <a class="suporte" href="#"> Solicitar Suporte  <img class="imagemsuporte" src="${pageContext.request.contextPath}/img/suporte.png"></a>
            </div>
        </footer>
        <!-- Fim Footer -->
        <link type="text/css" href="${pageContext.request.contextPath}/css/script.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/menu.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/gradiente.js"></script>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><img src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogomodal" style="width:20%;"> </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ${retornoMensagem}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
        <!--  Captura a variavel de retorno e abre modal-->
        <c:if test="${not empty retorno}">
            <script type="text/javascript">
            $("#myModal").modal();
            $('#myModal').on('hidden.bs.modal', function () {
                window.location.href = '${pageContext.request.contextPath}/view/index.jsp'
            })
            </script>
        </c:if>
    </body>