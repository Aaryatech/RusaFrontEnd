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
         
        <div class="inner-slider" id="slider">
            <div class="container">
                
            </div>
        </div>
        <div class="bridcrumb">
            <div class="container">
                
            </div>
        </div>
    
        <div class="container" id="main-content">
        <div class="row">
        	<div class="col-12 col-sm-12 col-lg-12 ">
            	<h1 style="text-align: center;">${sessionScope.maintainance.message}</h1>
            </div>
        </div>
            
         </div>
         
        
       
    </body>
</html>