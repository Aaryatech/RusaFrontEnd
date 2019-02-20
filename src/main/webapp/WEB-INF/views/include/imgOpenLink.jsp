<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="other-gov-site">
            <div class="container">
            <div class="jcarousel-wrapper">
            <div class="jcarousel">
                <ul>
              <c:forEach items="${sessionScope.image}" var="imageList" varStatus="count">
              
			  <li><img src="${sessionScope.url}${imageList.sliderImage}" alt="" width="100" height="50"></li>
								  
				</c:forEach>  
              </ul>
              </div>
              </div>
              
            </div>
        </div>