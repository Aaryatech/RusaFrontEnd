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
                <h1>${pageContent.pageName}</h1>
            </div>
        </div>
        <div class="bridcrumb">
            <div class="container">
                <%-- <a href="index.html">Home</a> > <a href="${pageContext.request.contextPath}/info/${pageContent.slugName}">${pageContent.pageName}</a> > --%>
            </div>
        </div>
        <div class="container" id="main-content">
            <div class="row row-eq-height">
                <div class="col-12 col-sm-3 col-lg-3">
                    <div class="leftColm">
                    <c:forEach items="${sessionScope.menuList}" var="menuList" >
                         <c:if test="${menuList.sectionId==pageContent.sectioinId}">
                         	<h3>${menuList.sectionName}</h3>
                         	  <ul class="menu">
                         	   
                         	 <c:forEach items="${menuList.catList}" var="catList" >
                            <!-- class="active" -->
                                <li><a  href="${pageContext.request.contextPath}/info/${catList.slugName}" href="cyber-security-courses.html">${catList.catName} </a> </li>
                                <c:forEach items="${catList.subCatList}" var="subCatList" >
                                 <li><a   href="${pageContext.request.contextPath}/info/${subCatList.subSlugName}" href="cyber-security-courses.html">${subCatList.subCatName} </a></li> 
                                </c:forEach>
                           
                            </c:forEach>
                            </ul>
                            
                         </c:if>
                        </c:forEach>
                         
                    </div>
                </div>
                <div class="col-12 col-sm-9 col-lg-9 right-Colm">
           
               <div class="row row-eq-height">
                        <div class="col-12">
                        <img src="${url}${image.featuredImage}" width="500" height="500">
                        <h2> ${image.heading}</h2>
                        <p>${image.descriptions}</p>
                         
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