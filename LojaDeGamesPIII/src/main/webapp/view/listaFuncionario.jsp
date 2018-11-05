
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/listaFuncionario" />
        <meta charset="UTF-8">
        <title>AcaiTech Sistema - Lista de Funcionarios</title>
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
            <form name="formularioBusca" id="formularioBusca" action="${pageContext.request.contextPath}/listaFuncionarioComFiltro" method="get">
                <div class="row">
                    <h3>Funcionarios cadastrados</h3>
                    <input class=" form-control mr-sm-2 descricaoFuncionario" name="nome"  type="search" placeholder="Digite o nome do Funcionario" aria-label="Search" style="width:90%">
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
                            <th scope="col">Nome</th>
                            <th scope="col">CPF</th>
                            <th scope="col">Filial</th>
                            <th scope="col">Cargo</th>
                            <th scope="col">Telefone</th>
                            <th scope="col">Celular</th>
                            <th scope="col">Editar</th>
                            <th scope="col">Excluir</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Lista para itens com filtros -->
                        <c:if test="${not empty listaComFiltro}">
                            <c:forEach var="Funcionario" items="${listaComFiltro}">
                                <tr class="">
                                    <td>${Funcionario.id}</td>
                                    <td>${Funcionario.nome}</td>
                                    <td>${Funcionario.cpf}</td>
                                    <td>${Funcionario.filial}</td>
                                    <td>${Funcionario.cargo}</td>
                                    <td>${Funcionario.telefone}</td>
                                    <td>${Funcionario.celular}</td>
                                    <td><a href="${pageContext.request.contextPath}/view/alterarFuncionario.jsp?idFuncionario=${Funcionario.id}">Editar</a></td>
                                    <td><a href="${pageContext.request.contextPath}/excluirFuncionario?idFuncionario=${Funcionario.id}">Excluir</a></td></tr>
                                </c:forEach>


                        </c:if>
                        <!-- Fim Lista para itens com filtros -->
                        <!-- Lista para itens sem filtros -->
                        <c:if test="${empty listaComFiltro and not empty lista}">
                            <c:forEach var="Funcionario" items="${lista}">
                                <tr class="">
                                    <td>${Funcionario.id}</td>
                                    <td>${Funcionario.nome}</td>
                                    <td>${Funcionario.cpf}</td>
                                    <td>${Funcionario.filial}</td>
                                    <td>${Funcionario.cargo}</td>
                                    <td>${Funcionario.telefone}</td>
                                    <td>${Funcionario.celular}</td>
                                    <td><a href="${pageContext.request.contextPath}/view/alterarFuncionario.jsp?idFuncionario=${Funcionario.id}">Editar</a></td>
                                    <td><a href="${pageContext.request.contextPath}/excluirFuncionario?idFuncionario=${Funcionario.id}">Excluir</a></td></tr>
                                </c:forEach>
                            </c:if>
                        <!-- Fim Lista para itens sem filtros -->
                    </tbody>
                </table>
                <div class="row">
                    <button type="submit" class="btn btn-primary btnCadastrar" onclick="window.location.href = '${pageContext.request.contextPath}/view/cadastrarFuncionario.jsp'">Cadastrar um novo Funcionario</button>
                    <c:if test="${not empty listaComFiltro}">
                        <button type="submit" class="btn btn-primary btnVoltar" onclick="window.location.href = '${pageContext.request.contextPath}/view/listaFuncionario.jsp'">Voltar</button>

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
        <link type="text/css" href="${pageContext.request.contextPath}/css/listaFuncionario.css" rel="stylesheet" />
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
                                window.location.href = '${pageContext.request.contextPath}/view/listaFuncionario.jsp'
                            })
            </script>
        </c:if> 

    </body>