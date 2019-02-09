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
                <a href="index.html">Home</a> > <a href="${pageContext.request.contextPath}/info/${pageContent.slugName}">${pageContent.pageName}</a> >
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
                <c:set var="find" value="0"></c:set>
                
                <c:if test="${pageContent.cmsContentList.size()>0}">
                <c:forEach items="${pageContent.cmsContentList}" var="cmsContentList">
                	 <h2>${cmsContentList.heading}</h2>
                    ${cmsContentList.pageDesc}
                    </c:forEach> 
                    <c:set var="find" value="1"></c:set> 
                </c:if>
                
                 <c:if test="${pageContent.faqContentList.size()>0}">
                 <h2>FAQ's</h2>
                 
                <c:forEach items="${pageContent.faqContentList}" var="faqContentList">
                	 
                    <ul>
                	<li>
                    	<strong>${faqContentList.faqQue}</strong><br>
						<div class="clearfix"></div>
                    	  ${faqContentList.faqAns}
                    </li>
                    </ul>
                    </c:forEach>
                    <c:set var="find" value="1"></c:set>   
                </c:if>
                
                <c:if test="${pageContent.documentUploadList.size()>0}">
                 <h2>Downloads</h2>
                 
                <c:forEach items="${pageContent.documentUploadList}" var="documentUploadList">
                	 
                	 <div class="pdfIcon"><a href="${url}${documentUploadList.fileName}" target="_blank">${documentUploadList.exVar1} - ${documentUploadList.fileSize}</a></div>
                	 
                    </c:forEach>
                    <c:set var="find" value="1"></c:set>   
                </c:if>
                
                 <c:if test="${pageContent.testImonialList.size()>0}">
                 <h2>Success Stories</h2> 
	                <div class="row">
	                 <c:forEach items="${pageContent.testImonialList}" var="testImonialList">
	                     <div class="col-12 col-sm-6 col-lg-6">
	                    	<div class="success-stories">
	                         ${testImonialList.message}
							<p><i><strong>${testImonialList.fromName}</strong></i></p>
	                        </div>
	                    </div>   
	                     </c:forEach>
	                </div>
	                    
                    <c:set var="find" value="1"></c:set>   
                </c:if>
                
                <c:if test="${pageContent.gallaryDetailList.size()>0}">
                  
	                <div class="row">
	                 <c:forEach items="${pageContent.gallaryDetailList}" var="gallaryDetailList">
	                       <div class="col-12 col-sm-3 col-lg-3">
                        <a href="http://www.webtreeindia.com/projectdemo/bppatilcollege/webadmin//../../uploads/gallery/20190123/gallery_0eGf.png" data-toggle="lightbox" data-gallery="plan" data-title="" class="thumbnail">
                        <img src="http://www.webtreeindia.com/projectdemo/bppatilcollege/webadmin//../../uploads/gallery/20190123/gallery_0eGf.png" class="img-responsive"></a>
                    </div>
	                     </c:forEach>
	                </div>
	                    
                    <c:set var="find" value="1"></c:set>   
                </c:if>
        
                 <c:if test="${pageContent.detailNewsList.size()>0}">
                  
	                 
	                 <c:forEach items="${pageContent.detailNewsList}" var="detailNewsList">
                 <div class="row row-eq-height">
                        <div class="col-12">
                        <img src="${url}${detailNewsList.featuredImage}">
                          <c:set var = "string1" value = "${detailNewsList.descriptions}"/>
 						 <c:set var = "string2" value = "${fn:substring(string1, 0, 256)}" />
                        <h2> ${detailNewsList.heading}</h2>
                        <p>${string2}</p>
                         <a  href="${pageContext.request.contextPath}/NewsDetails" >more </a>
                       </div> 
                    </div>
                    </c:forEach>
	                   
                    <c:set var="find" value="1"></c:set>   
                </c:if>
                    
            	<!-- <div class="row"> 
				      <div class="col-12 col-sm-3 col-lg-3">
				        <a href="http://www.youtube.com/watch?v=k6mFF3VmVAs" data-toggle="lightbox" data-gallery="mixedgallery" class="col-sm-4">
				    <img src="http://i1.ytimg.com/vi/yP11r5n5RNg/mqdefault.jpg" class="img-fluid">
				</a>
				</div>
                </div> -->
            
             
               
                 
                 <c:if test="${find==0}">
                 
                 <h2 style="text-align: center;">No Record Found</h2>
                 </c:if>
                 
                </div>
                
                 
            	
                
               
                
                 
            </div>
            </div>
         
       <jsp:include page="/WEB-INF/views/include/imgOpenLink.jsp"></jsp:include>
        
          <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        <!-- JavaScript-->
       <jsp:include page="/WEB-INF/views/include/footerJs.jsp"></jsp:include> 
       
       


       
    </body>
</html>