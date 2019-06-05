
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
        <jsp:include page="/listaCliente" />
        <meta charset="UTF-8">
        <title>AcaiTech Sistema - Lista de cleintes</title>
        <link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/js/formatterdinheiro.js"></script>
    </head>
    <body>
        <!-- Inicio Menu -->
        <nav class="navbar navbar-light bg-light">
                <div class="corpoimagem">
                    <a href="${pageContext.request.contextPath}/view/destaques.jsp"><img  src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo"></a>
                </div>



                <div class="menu-desktop">
                    <ul class="main-menu">

                        <li>
                            <a style="margin-right: 100px" href="institucional.jsp">Institucional</a>
                        </li>


                    </ul>
                </div>

                <div class="menu-desktop">
                    <ul class="main-menu">

                        <li>
                            <a href="${pageContext.request.contextPath}/view/alterarCliente.jsp?idCliente=${Cliente.id}">Meus Dados</a>
                        </li>


                    </ul>
                </div>
                
                 <div class="menu-desktop">
                    <ul class="main-menu">

                        <li>
                            <a href="listaCliente.jsp">Meus Pedidos</a>
                        </li>


                    </ul>
                </div>
                <form action="${pageContext.request.contextPath}/sairLogin" method="post">

                    <a style="color:white;" href="${pageContext.request.contextPath}/view/login.jsp">
                        <button type="button" class="btn btn-primary" >Login</button>
                    </a>

                    <a style="color:white;" href="${pageContext.request.contextPath}/view/carrinho.jsp">
                        <button type="button" class="btn btn-primary" >Carrinho</button>
                    </a>

                </form>
            </nav>
        <!-- Fim Menu -->
        <!-- Inicio Carrocel -->
        
        <!-- Fim Carrocel -->
        <!-- Inicio Separador -->
        <nav class="navbar navbar-light separadorcarrocel">
        </nav>
        <!-- Fim Separador -->
        <!-- inicio Busca jogos estoque -->
        <div style="margin-left: 80px" class="container corpodecampos">
            <form name="formularioBusca" id="formularioBusca" action="${pageContext.request.contextPath}/listaClienteComFiltro" method="get">
                <div class="row">
                    <h3>Meus pedidos</h3>
                    <input class=" form-control mr-sm-2 descricaoCliente" name="nome"  type="search" placeholder="Digite o nome do cliente" aria-label="Search" style="width:90%">
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
                            <th scope="col">Quantidade</th>
                            <th scope="col">Valor</th>
                            <th scope="col">Status</th>
                         </tr>
                    </thead>
                    <tbody>
                        <!-- Lista para itens com filtros -->
                        <c:if test="${not empty listaComFiltro}">
                            <c:forEach var="Cliente" items="${listaComFiltro}">
                                <tr class="">
                                    <td>${Cliente.id}</td>
                                    <td>${Cliente.nome}</td>
                                    <td>${Cliente.cpf}</td>
                                    <td>${Cliente.email}</td>
                                    
                                    
                                    <td><a href="${pageContext.request.contextPath}/view/alterarCliente.jsp?idCliente=${Cliente.id}">Editar</a></td>
                                    
                                </c:forEach>


                        </c:if>
                        <!-- Fim Lista para itens com filtros -->
                        <!-- Lista para itens sem filtros -->
                        <c:if test="${empty listaComFiltro and not empty lista}">
                            <c:forEach var="Cliente" items="${lista}">
                                <tr class="">
                                    <td>${Cliente.id}</td>
                                    <td>${Cliente.nome}</td>
                                    <td>${Cliente.cpf}</td>
                                    <td>${Cliente.email}</td>
                                    
                                    
                                    <td><a href="${pageContext.request.contextPath}/view/alterarCliente.jsp?idCliente=${Cliente.id}">Editar</a></td>
                                    
                                </c:forEach>
                            </c:if>
                        <!-- Fim Lista para itens sem filtros -->
                    </tbody>
                </table>
                <div class="row">
                    
                    <c:if test="${not empty listaComFiltro}">
                        <button type="submit" class="btn btn-primary btnVoltar" onclick="window.location.href = '${pageContext.request.contextPath}/view/listaCliente.jsp'">Voltar</button>

                    </c:if>
                </div>
            </div>


        </div><br><br><br><br>
        <!-- Inicio Footer -->
        <footer class="rodape page-footer font-small blue">
            <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]
               
            </div>
        </footer>
        <!-- Fim Footer -->
        <link type="text/css" href="${pageContext.request.contextPath}/css/script.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/listaCliente.css" rel="stylesheet" />
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