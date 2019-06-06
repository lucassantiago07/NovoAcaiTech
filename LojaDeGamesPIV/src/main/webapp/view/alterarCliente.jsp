<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <c:if test="${empty sessionScope.getNome}">
            <c:redirect url = "/expulsarDaPaginaSemLogar"/>
        </c:if>


        <jsp:include page="/capturaCliente" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>AçaiTech - Alterar Clientess</title>
        <link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/js/validanumero.js"></script>
    </head>
    <!-- Inicio Menu -->
    <nav class="navbar navbar-light bg-light">
        <div class="corpoimagem">
            <a href="${pageContext.request.contextPath}/view/destaques.jsp"><img  src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo"></a>
        </div>

        <form action="${pageContext.request.contextPath}/sairLogin" method="post">
            <a style="color:white;" href="${pageContext.request.contextPath}/view/carrinho.jsp">
                <button type="button" class="btn btn-primary" >Carrinho</button>
            </a>
            <button type="submit" class="btn btn-primary btnSair">Sair</button>
        </form>
    </nav>
    <!-- Fim Menu -->
    <body>
        <!-- Inicio Carrocel -->
      
        <!-- Fim Carrocel -->

        <!-- Inicio Separador -->
        <nav class="navbar navbar-light separadorcarrocel">

        </nav>
        <!-- Fim Separador -->
        <!-- Inicio Corpo De Campo -->
        <div class="container corpodecampos">
            <h3>Alterar Dados</h3>
            <form name="formularioCliente" id="formularioCliente" action="${pageContext.request.contextPath}/alterarCliente" method="post">
                <div class="form-group">
                    <input type="hidden"class="form-control" id="id" name="id" value="${cliente.id}" readonly="readonly"></input>
                </div>

                <div class="form-group">
                    <label>Nome</label>
                    <input class="form-control" id="nomeCliente" name="nomeCliente" value="${cliente.nome}" maxlength="50" required></input>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input class="form-control" id="emailCliente" name="emailCliente" value="${cliente.email}" maxlength="50" required></input>
                </div>
                <div class="form-group">
                    <label>CPF</label>
                    <input type="text" class="form-control" id="cpfCliente" name="cpfCliente" value="${cliente.cpf}" onkeypress="return isNumberKey(event)" maxlength="11" required></input>
                </div>
                <div class="form-group">
                    <label>Endereço</label>
                    <input class="form-control" id="enderecoCliente" name="enderecoCliente" value="${cliente.endereco}" maxlength="50" required></input>
                </div>
                <div class="form-group">
                    <label>CEP</label>
                    <input type="text" class="form-control" id="cepCliente" name="cepCliente" value="${cliente.cep}" onkeypress="return isNumberKey(event)" maxlength="8" required></input>
                </div>
                <div class="form-group">
                    <label>Telefone</label>
                    <input type="text" class="form-control" id="telefoneCliente" name="telefoneCliente" value="${cliente.telefone}" onkeypress="return isNumberKey(event)" maxlength="11" required></input>
                </div>

                <div class="form-group">
                    <label>Celular</label>
                    <input type="text" class="form-control" id="celularCliente" name="celularCliente" value="${cliente.celular}" onkeypress="return isNumberKey(event)" maxlength="11" required></input>
                </div>
                <div class="form-group">
                    <label>Senha</label>
                    <input type="text" class="form-control" id="senhaCliente" name="senhaCliente" value="${cliente.senha}" required></input>
                </div>
                

                <button type="button" class="btn btn-primary" style="background-color: gray;">                    
                    <a href="${pageContext.request.contextPath}/view/index.jsp" style="color:white;">Voltar</a>                       
                </button>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>




        </div>
        <!-- Fim Corpo De Campo -->

        <!-- Inicio Footer -->
        <footer class="rodape page-footer font-small blue">
            <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]
                <a class="suporte" href="#"> Solicitar Suporte  <img class="imagemsuporte" src="${pageContext.request.contextPath}/img/suporte.png"></a>
            </div>
        </footer>
        <!-- Fim Footer -->

        <link type="text/css" href="${pageContext.request.contextPath}/css/script.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/alterarCliente.css" rel="stylesheet" />
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
