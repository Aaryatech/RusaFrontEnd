<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <div class="top-section">
  <%@ page import="java.io.*,java.util.*, javax.servlet.*" 
  import = "java.text.SimpleDateFormat"%> 
<%
   Date date = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("dd MMM, yyyy | hh:mm a z", Locale.ENGLISH);	
   out.print( "<div class=\"date\">" +sf.format(date)+"</div>");
    
%>
    	<!--  <div class="date">09 Dec, 2018 | 12:38 PM IST</div> -->
        <div class="top-right-menu">
        	
            <a href="#main-content" class="dropdown-arrow"><span>Skip to main content</span></a>
            <a href="#slider" class="dropdown-arrow"><span>Skip to navigation</span></a>
            <a href="#" class="accbl style-switcher style-" data-rel="." title=".">A</a>
            <a href="#" class="accbl style-switcher style-" data-rel="," title=",">A</a>
            <a href="#" title="Text Size: Decrease -6%" class="r">A+</a>
            <a href="#" title="Text Size: Normal =100%" class="ts_normal_fix text_display_hidden ts_rollover">A</a>
            <a href="#" title="Text Size: Increase +6%" class="ts_increase_fix text_display_hidden ts_rollover">A-</a>
        	<a href="#">Login</a>
                <a href="#">Register</a>
                <a href="${pageContext.request.contextPath}/changeLangage/1-${mapping}">English</a>
                <a href="${pageContext.request.contextPath}/changeLangage/2-${mapping}">मराठी</a>
        </div>
		
        <div class="clearfix"></div>        
    </div>