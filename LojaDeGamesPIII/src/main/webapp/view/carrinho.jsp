
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>AcaiTech Sistema - Carrinho</title>
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
            
            
             <div class="informacoessobrefuncionario">
                <span class="nomedofuncionario">${sessionScope.getNome}</span> ●
                <span class="filialfuncionario">${sessionScope.getFilial}</span>  ●
                <span class="cargofuncionario">${sessionScope.getCargo}</span>  ●
                <span class="datafuncionario">${sessionScope.getData}</span>  
            </div>
            <form action="${pageContext.request.contextPath}/sairLogin" method="post">
                <button type="submit" class="btn btn-primary btnSair">Sair</button>
            </form>
                
                
        </div>
        <button type="button" class="btn btn-primary btnSair" onclick="window.location.href = '${pageContext.request.contextPath}'">Sair</button>
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

            <h3>Carrinho</h3>
            <div class="row" style="margin-top: 2%;margin-bottom: 2%;">

                <i style="margin-bottom:  2%; color:red">Clique no botão abaixo para adicionar um item ao carrinho, não esqueça de cadastrar no banco. Use o Script na base SQL do projeto.</i></br>
                <a href="http://localhost:8080/LojaDeGamesPIII/adicionarAoCarrinho?idProduto=1"><i>Adicionar produto ID: 1</i></a>
                <a href="http://localhost:8080/LojaDeGamesPIII/adicionarAoCarrinho?idProduto=2"><i>Adicionar produto ID: 2</i></a>
            </div>

            <table class="table table-sm" id="tablecarrinho">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Produto</th>
                        <th scope="col">Estoque</th>
                        <th scope="col">Quantidade</th>
                        <th scope="col">Preço Unitario</th>
                        <th scope="col">Preço Total</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Lista para itens com filtros -->
                    <c:if test="${not empty listaProdutos}">
                        <c:forEach var="produto" items="${listaProdutos}">
                            <tr class="">
                                <td>${produto.id}</td>
                                <td>${produto.nome}</td>     
                                <td>${produto.estoque}</td>   
                                <td><input type="number" class="form-control form-control-sm qtdCarrinho" value="${produto.qtdCarrinho}" max="${produto.estoque}"></input></td>
                                <td>${produto.precoDeVenda}</td>  
                                <td type="number">${produto.precoDeVenda * produto.qtdCarrinho}</td> 
                                <td><a href="#">Remover</a></td> 
                            </tr>
                        </c:forEach>


                    </c:if>


                </tbody>
            </table>




            <div class="row">
                <div class="corpoinformacoesdocliente col-4">
                    <div class="informacoesdocliente">
                        <label>Nome do cliente: </label>  
                        <input type="text" class="form-control form-control-sm "  value="abc" readonly="readonly"></input>
                        <label>CPF: </label>  
                        <input type="text" class="form-control form-control-sm "   value="abc" readonly="readonly"></input>
                        <label>Cliente desde de: </label>  
                        <input type="text" class="form-control form-control-sm "   value="abc"  readonly="readonly"></input>
                    </div>
                </div>
                <div class="corpoinformacoessobrepreco col-8">
                    <div class="informacoessobrepreco">
                        <label>SubTotal: </label>  
                        <input type="text"  pattern="([0-9]|[0-9]|[0-9])" class="form-control form-control-sm "  id="subtotal" readonly="readonly"></input>
                        <label>Desconto: </label>  
                        <input type="text" maxlength="2" max="20" pattern="([0-9]|[0-9]|[0-9])"class="form-control form-control-sm "   id="desconto"  value="2" ></input>
                        <label>Valor total: </label>  
                        <input type="text"  pattern="([0-9]|[0-9]|[0-9])" class="form-control form-control-sm "   id="valortotal" readonly="readonly"></input>
                    </div>
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
        <link type="text/css" href="${pageContext.request.contextPath}/css/carrinho.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/menu.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/gradiente.js"></script>
        <script src="${pageContext.request.contextPath}/js/carrinho.js"></script>

    </body>
</html>