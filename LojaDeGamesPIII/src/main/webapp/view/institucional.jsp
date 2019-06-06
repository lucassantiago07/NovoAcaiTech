<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        
        
        <meta charset="UTF-8">
        <title>AcaiTech Sistema - Institucional</title>
        <link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    </head>
    <body>
        <!-- Inicio Menu -->
        <c:if test= "${sessionScope.getEmail == 'santos'}">

        <nav class="navbar navbar-light bg-light">
            <div class="corpoimagem">
                <a href="${pageContext.request.contextPath}/view/destaques.jsp"><img  src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo"></a>
            </div>
            
             <div class="menu-desktop">
		<ul class="main-menu">
			<li class="active-menu">
                               <a id="idhomejsp" href="destaques.jsp">Home</a>
								
			</li>
                                                        
                                                                         												
		</ul>
	</div>
            
    <div class="menu-desktop">
	<ul class="main-menu">
							                                                        
           <li>
               <a href="institucional.jsp">Institucional</a>
                   </li>

                     												
						</ul>
				</div>
            
             <div class="menu-desktop">
						<ul class="main-menu">
							                                                        
                                                        <li>
                                                                <a href="listaProduto.jsp">Gerenciamento de Produtos</a>
                                                        </li>

                     												
						</ul>
				</div>
            
             <div class="menu-desktop">
						<ul class="main-menu">
							                                                        
                                                        <li>
                                                                <a href="relatorio.jsp">Relatórios</a>
                                                        </li>

                     												
						</ul>
				</div>
            
             <div class="menu-desktop">
						<ul class="main-menu">
							                                                        
                                                        <li>
                                                                <a href="listaCliente.jsp">Meus Dados</a>
                                                        </li>

                     												
						</ul>
				</div>
            
            
            
            <form action="${pageContext.request.contextPath}/sairLogin" method="post">
                
                 <a style="color:white;" href="/view/login.jsp">
                    <button type="button" class="btn btn-primary" >Login</button>
                </a>
                
                <a style="color:white;" href="${pageContext.request.contextPath}/view/carrinho.jsp">
                    <button type="button" class="btn btn-primary" >Carrinho</button>
                </a>
                <button type="submit" class="btn btn-primary btnSair">Sair</button>
            </form>
        </nav>
           </c:if>

           <c:if test= "${sessionScope.getEmail != 'santos'}">

            <nav class="navbar navbar-light bg-light">
            <div class="corpoimagem">
                <a href="${pageContext.request.contextPath}/view/destaques.jsp"><img  src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo"></a>
            </div>
            
             
            
            <div class="menu-desktop">
		<ul class="main-menu">
							                                                        
                    <li>
                        <a style="margin-right: 1000px" href="institucional.jsp">Institucional</a>
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
                 
                 
                 
                 
             </c:if>
        <!-- Fim Menu -->
        <br><br>
        <div class="sec-banner bg0 p-t-80 p-b-50">
		<div class="container">
			

                    <p>A Açaí Tech é uma loja exclusivamente online.</p><br>
                        
                    <p>Além de ter o melhor preço, enviamos nossos produtos para todo o Brasil com frete grátis!</p><br>
                    
                    <p>Oferecemos garantia de 2 meses em todos a loja. </p><br>
                    
                    <p>É um prazer recebê-lo. Em caso de dúvidas, entre contato conosco.</p><br>
                    
                    <p>Seja bem vindo, e boas compras!</p><br>
                    
                    <p>Equipe Açaí Tech</p>
                    
				
			</div>
		</div>
       
        <br><br><br><br><br><br><br><br><br>
        <!-- Footer -->
        <footer class="rodape page-footer font-small blue">
            <!-- Copyright -->
            <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]
                
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
        <link type="text/css" href="${pageContext.request.contextPath}/css/script.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/destaques.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/menu.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/gradiente.js"></script>

        <c:if test="${not empty filtro}">
            <script type="text/javascript">
                $(".removedordefiltro").css('visibility', 'visible')
            </script>
        </c:if>  
    </body>
</html>