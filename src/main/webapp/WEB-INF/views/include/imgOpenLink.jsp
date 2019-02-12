<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="other-gov-site">
            <div class="container">
              <c:forEach items="${sessionScope.image}" var="imageList" varStatus="count">
              
			  <img src="${sessionScope.url}${imageList.sliderImage}" alt="" width="100" height="50">
								  
				</c:forEach>  
              
            </div>
        </div>