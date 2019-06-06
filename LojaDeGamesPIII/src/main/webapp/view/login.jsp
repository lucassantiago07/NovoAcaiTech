<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <jsp:include page="/criaCarrinho" />
        <meta charset="UTF-8">
        <title>AcaiTech Sistema - Login</title>
    </head>
    <body>
        <div class="corpoimagem">
            <img src="img/logo.png"  class="imagemlogo">
        </div>
        <div id="myId" class="myClass">



            <div id="parent">
                <form id="form_login" action="${pageContext.request.contextPath}/validaLogin" method="post">
                    <div class="corpologin" style="margin-top:17%;">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Cliente: </label>
                            <input type="text" class="form-control" id="" aria-describedby="emailHelp" placeholder="Digite o seu e-mail" name="email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Senha: </label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Digite a senha" name="senha">
                        </div>
                        <button type="submit" class="btn btn-primary">Entrar</button>
                            
                        <a style="color:white;" href="${pageContext.request.contextPath}/view/cadastrarCliente.jsp">
                    <button type="button" class="btn btn-primary" >Cliente novo? Cadastrar</button>
                        </a>

                    </div>

                </form>

            </div>
        </div>
        
        
        <script src="js/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.js"></script>
       <!-- <script src="js/background-video.js"></script> -->
        <link type="text/css" href="css/background-video.css" rel="stylesheet" />      
        <link type="text/css" href="css/bootstrap.css" rel="stylesheet" />
        <link type="text/css" href="css/script.css" rel="stylesheet" />
        <link type="text/css" href="css/login.css" rel="stylesheet" />

     
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
        <c:if test="${retorno == 'ok'}">
            <script type="text/javascript">
                $("#myModal").modal();
                $('#myModal').on('hidden.bs.modal', function () {
                    window.location.href = '${pageContext.request.contextPath}/view/destaques.jsp'
                })
            </script>
        </c:if> 

        


        <!--  Quando clica em sair ele ajusta para apontar para pagina de login -->
        <c:if test="${not empty sairLogin}">
            <script type="text/javascript">
                window.location.href = '${pageContext.request.contextPath}'
            </script>
        </c:if> 
    </body>
