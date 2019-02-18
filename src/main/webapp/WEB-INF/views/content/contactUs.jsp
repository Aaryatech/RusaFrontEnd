<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import="com.ats.rusafronend.model.Maintainance"%>


 <%
//allow access only if session exists
String user = null;
	if (session.getAttribute("menuList") == null) {
		response.sendRedirect("changeLangage//");
	}else{
		if (session.getAttribute("maintainance") != null) {
			Maintainance main = (Maintainance) session.getAttribute("maintainance");
			if (main.getMaintenanceStatus()==1) { 
				String contextPath = request.getContextPath();
				contextPath=contextPath+"/siteInMaintainance";
				response.sendRedirect(contextPath);
			}
		}
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
        <div class="row">
        	<div class="col-12 col-sm-12 col-lg-12 ">
            	<iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d60304.577356534086!2d72.89611441799786!3d19.149897683543813!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7b86e528cb077%3A0xbeb39574202b3e0e!2sRusa+International!5e0!3m2!1sen!2sin!4v1549861576012" style="border:0" allowfullscreen="" width="100%" height="350" frameborder="0"></iframe>
            </div>
        </div>
            <div class="row row-eq-height">
            
            
                <div class="col-12 col-sm-3 col-lg-3">
                    <div class="leftColm">
                    <c:forEach items="${sessionScope.menuList.sectionlist}" var="menuList" >
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
        	
            <div class="col-12 col-sm-9 col-lg-9 right-Colm">
            
            
            	<h2>Rashtriya Uchchatar Shiksha Abhiyan</h2>
                
                <p>
                Unit No.7, 19th floor, Center No. 1, World Trade Centre, Cuffe Parade,<br>
				Colaba, Mumbai-400005.<br>
				Phone: 011 - 49725600
                </p>
                
                <form action="${pageContext.request.contextPath}/insertContactUs" 
                   onsubmit="return confirm('Do you really want to submit the form?');" method="post">
                	<label>Your Name</label>
					<input type="text" class="form-control" name="name" id="name"  placeholder="Name" required="">
                    
                    <label>Your Email</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="Email" required="">
                    
                    <label>Phone Number</label>
                    <input type="text" class="form-control" name="mobileNo" id="mobileNo"  pattern="[7-9]{1}[0-9]{9}" placeholder="Mobile Number" required="">
                    
                    <label>Your Message</label>  
                    <textarea name="message" id="message" class="form-control" placeholder="Message"></textarea>
					<br>
                    <button type="submit" id="contact-btn" class="btn btn-primary"><span>Send</span></button>
				</form>
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