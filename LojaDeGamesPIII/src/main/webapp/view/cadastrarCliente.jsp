<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AcaiTech Sistema - Cadastrar Cliente</title>
        <link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/js/validanumero.js"></script>
    </head>



    <body>

        <!-- Inicio Menu -->
        <nav class="navbar navbar-light bg-light">
            <div class="corpoimagem">
                <a href="${pageContext.request.contextPath}/view/destaques.jsp"><img  src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo"></a>
            </div>

<!-- Inicio Menu 
            <div class="informacoessobrefuncionario">
                <span class="nomedofuncionario">${sessionScope.getNome}</span> ●
                <span class="filialfuncionario">${sessionScope.getFilial}</span>  ●
                <span class="cargofuncionario">${sessionScope.getCargo}</span>  ●
                <span class="datafuncionario">${sessionScope.getData}</span>  
            </div>
-->

            <form action="${pageContext.request.contextPath}/sairLogin" method="post">
                
                
                <a style="color:white;" href="${pageContext.request.contextPath}/view/login.jsp">
                    <button type="button" class="btn btn-primary btnCadastro2" >Já possui cadastro? Faça login</button>
                </a>
                    
                    <a style="color:white;" href="${pageContext.request.contextPath}/view/logar.jsp">
                    <button type="submit" class="btn btn-primary btnSair">Sair</button>
                    </a>
                
            </form>
        </nav>
        <!-- Fim Menu -->


        <!-- Inicio Carrocel 
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
                
                -->
        <!-- Fim Carrocel -->

        <!-- Inicio Separador -->
        <nav class="navbar navbar-light separadorcarrocel">

        </nav>
        <!-- Fim Separador -->

        <!-- Inicio Corpo De Campo -->
        <div class="container corpodecampos">

            <h3>Preencha o formulário abaixo</h3>

            
            <form name="formularioCliente" id="formularioCliente" action="${pageContext.request.contextPath}/cadastrarCliente" method="post">

                <div class="form-group">
                    <label>Nome</label>
                    <input class="form-control" id="nomeCliente" name="nomeCliente" maxlength="50" required></input>
                </div>
               
                <div class="form-group">
                    <label>CPF</label>
                    <input type="text" class="form-control" id="cpfCliente" name="cpfCliente" onkeypress="return isNumberKey(event)" maxlength="11" required></input>
                </div>
                
                <div class="form-group">
                    <label>CEP</label>
                    <input type="text" class="form-control" id="cepCliente" name="cepCliente" onkeypress="return isNumberKey(event)" maxlength="8" required></input>
                </div>
                
                <div class="form-group">
                    <label>Endereço</label>
                    <input class="form-control" id="endereco" name="endereco" maxlength="50" required></input>
                </div>
                
                <div class="form-group">
                    <label>Número: </label>
                    <input class="form-control" id="endereco" name="numeroenderecoCliente" maxlength="50" required></input>
                </div>
               
                <div class="form-group">
                    <label>Complemento</label>
                    <input class="form-control" id="endereco" name="complementoCliente" maxlength="50" required></input>
                </div>
                
                <div class="form-group">
                    <label>Cidade</label>
                    <input class="form-control" id="endereco" name="cidadeCliente" maxlength="50" required></input>
                </div>
                
                <div class="form-group">
                    <label>Estado</label>
                    <input class="form-control" id="endereco" name="estadoCliente" maxlength="50" required></input>
                </div>

                <div class="form-group">
                    <label>Telefone</label>
                    <input type="text" class="form-control" id="telefone" name="telefone" onkeypress="return isNumberKey(event)" maxlength="11" required></input>
                </div>

                <div class="form-group">
                    <label>Celular</label>
                    <input type="text" class="form-control" id="celular" name="celular" onkeypress="return isNumberKey(event)" maxlength="11" required></input>
                </div>
                
                <div class="form-group">
                    <label>Email</label>
                    <input class="form-control" id="emailCliente" name="emailCliente" maxlength="50" required></input>
                </div>
                
                <div class="form-group">
                    <label>Senha</label>
                    <input type="password" class="form-control" id="senhaCliente" name="senhaCliente" maxlength="50" required></input>
                </div>

                <button type="button" class="btn btn-primary" style="background-color: gray;">                    
                    <a href="${pageContext.request.contextPath}/view/destaques.jsp" style="color:white;">Voltar</a>                       
                </button>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        


        </div>
        <!-- Fim Corpo De Campo -->


        <!-- Inicio Footer -->
        <footer class="rodape page-footer font-small blue">
            <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]            
            </div>
        </footer>
        <!-- Fim Footer -->

        <link type="text/css" href="${pageContext.request.contextPath}/css/script.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/cadastrarCliente.css" rel="stylesheet" />
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
