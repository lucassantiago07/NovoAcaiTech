
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <script src="${pageContext.request.contextPath}/js/formatterdinheiro.js"></script>
    </head>
    <body>
        <!-- Inicio Menu -->
        <nav class="navbar navbar-light bg-light">
            <div class="corpoimagem">
                <img src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo">
            </div>


            <div class="informacoessobrefuncionario">
                <span class="nomedofuncionario">${sessionScope.getNome}</span> ●
                <span class="filialfuncionario">${sessionScope.getFilial}</span>  ●
                <span class="cargofuncionario">${sessionScope.getCargo}</span>  ●
                <span class="datafuncionario">${sessionScope.getData}</span>  
            </div>
            <form action="${pageContext.request.contextPath}/sairLogin" method="post">
                <button type="submit" class="btn btn-primary btnSair">Sair</button>
            </form>

        </nav>
        <!-- Fim Menu -->
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
        <!-- inicio Busca jogos estoque -->
        <div class="container corpodecampos">
            <form name="formularioBusca" id="formularioBusca" action="${pageContext.request.contextPath}/listaProdutoComFiltro" method="get">
                <div class="row">
                    <h3>Estoque Atual</h3>
                    <input class=" form-control mr-sm-2 descricaoProduto" name="descricaoProduto"  type="search" placeholder="Digite o nome do jogo,fornecedor, ano de lançamento, plataforma, ..etc" aria-label="Search" style="width:90%">
                    <button type="submit" class="btn btn-light">Buscar</button>
                </div>
            </form>
        </div>
        <!-- fim Busca jogos estoque-->
        <div class="corpotabela">
            <div class="">
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Produto</th>
                            <th scope="col">Preço De Venda</th>
                            <th scope="col">Preço De Custo</th>
                            <th scope="col">Fornecedor</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Lançamento</th>
                            <th scope="col">Qtd de estoque</th>
                            <th scope="col">Data de Cadastro</th>
                            <th scope="col">Add. Carrinho</th>
                            <th scope="col">Editar</th>
                            <th scope="col">Excluir</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Lista para itens com filtros -->
                        <c:if test="${not empty listaComFiltro}">
                            <c:forEach var="produto" items="${listaComFiltro}">
                                <tr class="">
                                    <td>${produto.id}</td>
                                    <td>${produto.nome}</td>                                    
                                    <td>${produto.precoDeVenda}</td>
                                    <td>${produto.precoDeCusto}</td>
                                    <td>${produto.fornecedor}</td>



                                    <c:if test="${produto.categoria == 1}">
                                        <td>Ação</td>
                                    </c:if>
                                    <c:if test="${produto.categoria == 2}">
                                        <td>Corrida</td>
                                    </c:if>
                                    <c:if test="${produto.categoria == 3}">
                                        <td>Tiro</td>
                                    </c:if>
                                    <c:if test="${produto.categoria == 4}">
                                        <td>RPG</td>
                                    </c:if>
                                    <c:if test="${produto.categoria == 5}">
                                        <td>Estratégia</td>
                                    </c:if>
                                    <c:if test="${produto.categoria == ''}">
                                        <td>Não encontrado</td>
                                    </c:if>
                                    <td>${produto.anoLancamento}</td>
                                    <td>${produto.estoque}</td>                                
                                    <td>${produto.dataCadastro}</td>

                                    <td><a href="${pageContext.request.contextPath}/adicionarAoCarrinho?idProduto=${produto.id}">Add. Carrinho</a></td>
                                    <td><a href="${pageContext.request.contextPath}/view/alterarProduto.jsp?idProduto=${produto.id}">Editar</a></td>
                                    <td><a href="${pageContext.request.contextPath}/excluirProduto?idProduto=${produto.id}">Excluir</a></td></tr>
                                </c:forEach>


                        </c:if>
                        <!-- Fim Lista para itens com filtros -->
                        <!-- Lista para itens sem filtros -->
                        <c:if test="${empty listaComFiltro and not empty lista}">
                            <c:forEach var="produto" items="${lista}">
                                <tr class="">
                                    <td>${produto.id}</td>
                                    <td>${produto.nome}</td>                                    
                                    <td>${produto.precoDeVenda}</td>
                                    <td>${produto.precoDeCusto}</td>
                                    <td>${produto.fornecedor}</td>

                                    <c:if test="${produto.categoria == 1}">
                                        <td>Ação</td>
                                    </c:if>
                                    <c:if test="${produto.categoria == 2}">
                                        <td>Corrida</td>
                                    </c:if>
                                    <c:if test="${produto.categoria == 3}">
                                        <td>Tiro</td>
                                    </c:if>
                                    <c:if test="${produto.categoria == 4}">
                                        <td>RPG</td>
                                    </c:if>
                                    <c:if test="${produto.categoria == 5}">
                                        <td>Estratégia</td>
                                    </c:if>
                                    <c:if test="${produto.categoria == ''}">
                                        <td>Não encontrado</td>
                                    </c:if>

                                    <td>${produto.anoLancamento}</td>
                                    <td>${produto.estoque}</td>                                
                                    <td>${produto.dataCadastro}</td>
                                    <td><a href="${pageContext.request.contextPath}/adicionarAoCarrinho?idProduto=${produto.id}">Add. Carrinho</a></td>
                                    <td><a href="${pageContext.request.contextPath}/view/alterarProduto.jsp?idProduto=${produto.id}">Editar</a></td>
                                    <td><a href="${pageContext.request.contextPath}/excluirProduto?idProduto=${produto.id}">Excluir</a></td></tr>
                                </c:forEach>
                            </c:if>
                        <!-- Fim Lista para itens sem filtros -->
                    </tbody>
                </table>
                <div class="row">
                    <button type="submit" class="btn btn-primary btnCadastrar" onclick="window.location.href = '${pageContext.request.contextPath}/view/cadastrarProduto.jsp'">Cadastrar um novo produto</button>
                    <c:if test="${not empty listaComFiltro}">
                        <button type="submit" class="btn btn-primary btnVoltar" onclick="window.location.href = '${pageContext.request.contextPath}/view/listaProduto.jsp'">Voltar</button>

                    </c:if>
                </div>
            </div>


        </div>
        <!-- Inicio Footer -->
        <footer class="rodape page-footer font-small blue">
            <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]
                <a class="suporte" href="#"> Solicitar Suporte  <img class="imagemsuporte" src="${pageContext.request.contextPath}/img/suporte.png"></a>
            </div>
        </footer>
        <!-- Fim Footer -->
        <link type="text/css" href="${pageContext.request.contextPath}/css/script.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/listaProduto.css" rel="stylesheet" />
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
                                window.location.href = '${pageContext.request.contextPath}/view/listaCliente.jsp'
                            })
            </script>
        </c:if> 
    </body>