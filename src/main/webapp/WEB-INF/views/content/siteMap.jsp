<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
	


 <%
//allow access only if session exists
String user = null;
if(session.getAttribute("menuList") == null){
	response.sendRedirect("changeLangage//");
} 
%>
 <!DOCTYPE html>
<html lang="en">
    <head>
          <jsp:include page="/WEB-INF/views/include/meta.jsp"></jsp:include>
    </head>
    <body>
         <jsp:include page="/WEB-INF/views/include/topBar.jsp"></jsp:include>
         <jsp:include page="/WEB-INF/views/include/topMenu.jsp"></jsp:include>
        <div class="inner-slider" id="slider">
            <div class="container">
                <h1>Site Map</h1>
            </div>
        </div>
        <div class="bridcrumb">
            <div class="container">
                <a href="index.html">Home</a> > <a href="${pageContext.request.contextPath}/info/${pageContent.slugName}">${pageContent.pageName}</a> >
            </div>
        </div>
        <div class="container" id="main-content">
            <div class="row row-eq-height">
                <div class="col-12 col-sm-3 col-lg-3">
                    <div class="leftColm">
                    <h3>Site Map</h3>
                    <ul class="menu">
                    <c:forEach items="${sessionScope.menuList}" var="menuList" >
                          
                                <li><a  href="${pageContext.request.contextPath}/info/${menuList.sectionSlugname}" href="cyber-security-courses.html">${menuList.sectionName} </a> </li>
                                 
                        </c:forEach>
                          </ul>
                    </div>
                </div>
                <div class="col-12 col-sm-9 col-lg-9 right-Colm">
                 <div id="site-map"> 
						  <div class="site-map-menus"> 
						  
						<c:forEach items="${sessionScope.menuList}" var="menuList" >
							<div class="site-map-box-menu site-map-box-menu-menu-about-mhrd-menu site-map-box-menu site-map-box-menu-menu-accessibility-statement site-map-box"><h2 class="title">${menuList.sectionName}</h2>
								<div class="content"> 
									 <c:forEach items="${menuList.catList}" var="catList" >
										 <ul class="site-map-menu list"><li class="first leaf"><a href="${pageContext.request.contextPath}/info/${catList.slugName}" title="Accessibility Features">${catList.catName}</a></li>
										 
											  <c:forEach items="${catList.subCatList}" var="subCatList" >
												<li class="leaf"><a href="${pageContext.request.contextPath}/info/${subCatList.subSlugName}" title="Screen Reader Access ">${subCatList.subCatName} </a></li> 
											</c:forEach>
										</ul>
									 </c:forEach>
								</div>
							</div> 
						</c:forEach>
						 
						</div> 
				</div>
                </div>
                 
            </div>
            </div>
         
       <jsp:include page="/WEB-INF/views/include/imgOpenLink.jsp"></jsp:include>
        
          <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        <!-- JavaScript-->
       <jsp:include page="/WEB-INF/views/include/footerJs.jsp"></jsp:include> 
       
       


       
    </body>
</html>