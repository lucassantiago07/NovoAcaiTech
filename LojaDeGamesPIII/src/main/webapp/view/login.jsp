<%-- 
    Document   : login
    Created on : 14/10/2018, 12:07:05
    Author     : angelo.xavier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>AcaiTech Sistema - Login</title>
    </head>
    <body>
        <div class="corpoimagem">
            <img src="img/logo.png"  class="imagemlogo">
        </div>
        <div id="myId" class="myClass">



            <div id="parent">
                <form id="form_login">
                    <div class="corpologin" style="margin-top:17%;">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Úsuario</label>
                            <input type="email" class="form-control" id="" aria-describedby="emailHelp" placeholder="" disabled>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Senha</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="" disabled>
                        </div>
                        <button type="submit" class="btn btn-primary" disabled>Entrar</button>

                        <div class="" style="text-align: center; margin-top: 2%;">
                            <h4 style="color:red"> Entrega 18/10/2018 - CRUD de Produto </h4>
                            <button type="button" class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/view/cadastrarProduto.jsp'">Cadastrar um produto</button>
                            <button type="button" class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/view/listaProduto.jsp'">Listar os produtos cadastrados</button>
                        </div>
                    </div>

                </form>

            </div>
        </div>
        <script src="js/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/background-video.js"></script>
        <link type="text/css" href="css/background-video.css" rel="stylesheet" />      
        <link type="text/css" href="css/bootstrap.css" rel="stylesheet" />
        <link type="text/css" href="css/script.css" rel="stylesheet" />
        <link type="text/css" href="css/login.css" rel="stylesheet" />
    </body>
