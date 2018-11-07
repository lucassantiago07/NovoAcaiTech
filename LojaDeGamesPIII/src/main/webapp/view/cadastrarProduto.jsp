<%-- 
   Document   : alterarProduto
   Created on : 16/10/2018, 09:22:17
   Author     : angelo.xavier
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <c:if test="${empty sessionScope.getNome}">
            <c:redirect url = "/expulsarDaPaginaSemLogar"/>
        </c:if>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>AcaiTech Sistema - Cadastrar Produtos</title>
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

            <h3>Cadastrar Produto</h3>

            <form name="formularioProduto" id="formularioProduto" action="${pageContext.request.contextPath}/cadastrarProduto" method="post">

                <div class="form-group">
                    <label>Nome do Produto</label>
                    <input class="form-control" id="nomeProduto" name="nomeProduto" maxlength="20" required></input>
                </div>
                <div class="form-group">
                    <label>Preço De Venda</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">R$</div>
                        </div>
                        <input type="Text" class="form-control"  id="precoVenda" name="precoVenda" size="4" maxlength="5"  onkeypress="return isNumberKey(event)" required />

                    </div>
                </div>
                <div class="form-group">
                    <label>Preço De Custo</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">R$</div>
                        </div>
                        <input type="Text" class="form-control"  id="precoCusto" name="precoCusto" size="4" maxlength="5"  onkeypress="return isNumberKey(event)"required />
                    </div>
                </div>
                <div class="form-group">
                    <label>Fornecedor</label>
                    <input class="form-control" id="fornecedor" name="fornecedor" maxlength="20" required></input>
                </div>
                <div class="form-group">
                    <label>Plataforma</label>
                    <input class="form-control" id="plataforma" name="plataforma" maxlength="20" required></input>
                </div>
                <div class="form-group">
                    <label>Ano de lançamento</label>
                    <input type="text" class="form-control" id="anolancamento" name="anolancamento" onkeypress="return isNumberKey(event)" maxlength="5" required></input>
                </div>
                <div class="form-group">
                    <label>Categoria</label>
                    <select class="form-control" id="categoria" name="categoria" required>
                        <option value="1">Ação</option>
                        <option value="2">Corrida</option>
                        <option value="3">Tiro</option>
                        <option value="4">RPG</option>
                        <option value="5">Estratégia</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Quantidade</label>
                    <input type="text" class="form-control" id="estoque" name="estoque" onkeypress="return isNumberKey(event)" maxlength="5" required></input>
                </div>
                <div class="form-group">
                    <label>Descrição</label>
                    <input class="form-control" id="descricao" maxlength="40" name="descricao"></input>
                </div>
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
        <link type="text/css" href="${pageContext.request.contextPath}/css/cadastrarProduto.css" rel="stylesheet" />
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
</html>