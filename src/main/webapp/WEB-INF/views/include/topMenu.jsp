<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
  
   <div class="top-menu" id="top-menu">
    <div>
        <div class="navbar navbar-expand-md ">
            <div class="container">
                <a class="navbar-brand" href="index.html"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample01" aria-controls="navbarsExample01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <form class="form-inline my-2 my-md-0">
                    <input class="form-control" type="text" placeholder="Search">
                    <button type="submit" id="contact-btn" class="btn button search"><span class="icon-search icon"></span></button>
                </form>
            </div>
        </div>
        <%-- <nav class="navbar navbar-expand-md bg-dark">
            <div class="container">
                <div class="collapse navbar-collapse" id="navbarsExample01">
                    <ul class="navbar-nav mr-end">
                     <c:forEach items="${sessionScope.menuList}" var="menuList" >
	                      <c:choose>
	                      	<c:when test="${menuList.catList.size()>0}">
	                      		<li class="nav-item dropdown">
	                            <a class="nav-link dropdown-toggle" href="apply-for-research-grants.html" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${menuList.sectionName}</a>
	                            <div class="dropdown-menu" aria-labelledby="dropdown01">
		                             <c:forEach items="${menuList.catList}" var="catList" >
		                             	<a class="dropdown-item" href="${pageContext.request.contextPath}/info/${catList.slugName}">${catList.catName}</a>
		                             	 <c:forEach items="${catList.subCatList}" var="subCatList" >
		                             	 	<a class="dropdown-item" href="${pageContext.request.contextPath}/info/${subCatList.subSlugName}">${subCatList.subCatName}</a>
		                             	 </c:forEach>
		                             </c:forEach>
	                               
	                            </div>
                          </li> 
	                      	</c:when>
	                      	<c:otherwise>
	                      		<li >
	                            <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/info/${menuList.sectionSlugname}" id="dropdown01"   aria-haspopup="true" aria-expanded="false">${menuList.sectionName}</a>
	                            
                          </li> 
	                      	</c:otherwise>
	                      </c:choose>
                     	 
                     </c:forEach> 
                    </ul>
                </div>
            </div>
        </nav> --%>
        
        <nav class="navbar navbar-expand-md bg-dark">
          <div class="container">
              <div class="collapse navbar-collapse" id="navbarsExample01">
                  <ul class="navbar-nav mr-end">
                  <c:forEach items="${sessionScope.menuList}" var="menuList" >
	                      <li class="nav-item dropdown">
	                      <c:choose>
	                      	<c:when test="${menuList.catList.size()>0}">
	                      	
	                          <a href="${pageContext.request.contextPath}/info/${menuList.sectionSlugname}" class="dropdown-toggle nav-link dropdown-toggle" data-toggle="dropdown">${menuList.sectionName} 
	                          <span class="caret"></span></a>
	                          <ul class="dropdown-menu">
	                          	 <c:forEach items="${menuList.catList}" var="catList" >
	                          	 	 <c:choose>
	                      				<c:when test="${catList.subCatList.size()>0}">
				                      		<li class="dropdown-submenu">
				                                  <a class="test" tabindex="-1" href="${pageContext.request.contextPath}/info/${catList.slugName}">${catList.catName}<span class="caret"></span></a>
				                                  <ul class="dropdown-menu">
					                                  <c:forEach items="${catList.subCatList}" var="subCatList" >
					                                      <li class="dropdown-item">
					                                          <a class="test" href="${pageContext.request.contextPath}/info/${subCatList.subSlugName}">${subCatList.subCatName} </a>
					                                      </li>
					                                     </c:forEach>
				                                  </ul>
				                              </li>
	                      				</c:when>
	                      				<c:otherwise>
	                      				<li class="dropdown-item"><a class="test" href="${pageContext.request.contextPath}/info/${catList.slugName}">${catList.catName}</a></li>
	                      				</c:otherwise>
	                      			</c:choose> 
	                              </c:forEach>
	                          </ul>
	                         </c:when>
	                         <c:otherwise>
	                         	 <a class="nav-link" href="${pageContext.request.contextPath}/info/${menuList.sectionSlugname}" >${menuList.sectionName}</a>
	                         </c:otherwise>
	                         </c:choose>
	                      </li> 
                      </c:forEach>
                  </ul>
              </div>
          </div>
      </nav>
    </div>
</div>	