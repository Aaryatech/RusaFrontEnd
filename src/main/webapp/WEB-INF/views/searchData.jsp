<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<%
	//allow access only if session exists
	String user = null;
	if (session.getAttribute("menuList") == null) {
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
			<a href="${pageContext.request.contextPath}/">Home</a>
		</div>
	</div>
	<div class="container" id="main-content">
		<div class="row row-eq-height">

			<div class="col-12 col-sm-9 col-lg-9 right-Colm">
				<c:set var="find" value="0"></c:set>

				<c:if test="${searchData.cmsSerchList.size()>0}">

					<c:forEach items="${searchData.cmsSerchList}" var="cmsSerchList">

						<h2>
							<a href="${pageContext.request.contextPath}/info/${cmsSerchList.pageSlug}">${cmsSerchList.heading}</a>
						</h2>
						<c:set var="string1" value="${cmsSerchList.pageDesc}" />
						<c:set var="string2" value="${fn:substring(string1, 0, 256)}" />
                    ${string2}.....
                    
                    <br>
					</c:forEach>
					<hr>

					<c:set var="find" value="1"></c:set>
				</c:if>

				<c:if test="${searchData.faqSerchList.size()>0}">
					<h2>FAQ's</h2>

					<c:forEach items="${searchData.faqSerchList}" var="faqSerchList">

						<h2>
							<a href="${pageContext.request.contextPath}/info/${faqSerchList.pageSlug}">${faqSerchList.faqQue}</a>
						</h2>
						<c:set var="string1" value="${faqSerchList.faqAns}" />
						<c:set var="string2" value="${fn:substring(string1, 0, 256)}" />
                    ${string2}.....
                    
                    <br>
					</c:forEach>
					<hr>
					<c:set var="find" value="1"></c:set>
				</c:if>

				<c:if test="${searchData.newsSerchList.size()>0}">
					<h2>News</h2>

					<c:forEach items="${searchData.newsSerchList}" var="newsSerchList">

						<h2>
							<a href="${pageContext.request.contextPath}/info/${newsSerchList.pageSlug}">${newsSerchList.heading}</a>
						</h2>
						<c:set var="string1" value="${newsSerchList.descriptions}" />
						<c:set var="string2" value="${fn:substring(string1, 0, 256)}" />
                    	${string2}.....
                    
                    <br>
					</c:forEach>
					<hr>
					<c:set var="find" value="1"></c:set>
				</c:if>

				<c:if test="${searchData.gallerySerchList.size()>0}">
					<h2>Gallery</h2>
					<c:forEach items="${searchData.gallerySerchList}"
						var="gallerySerchList">

						<h2>
							<a href="${pageContext.request.contextPath}/info/${gallerySerchList.pageSlug}">${gallerySerchList.title}</a>
						</h2>

						<br>
					</c:forEach>
					<hr>
					<c:set var="find" value="1"></c:set>
				</c:if>

				<c:if test="${searchData.documentSerchList.size()>0}">
					<h2>Document</h2>
					<c:forEach items="${searchData.documentSerchList}"
						var="documentSerchList">

						<h2>
							<a href="${pageContext.request.contextPath}/info/${documentSerchList.pageSlug}">${documentSerchList.fileName}</a>
						</h2>

						<br>
					</c:forEach>
					<hr>
					<c:set var="find" value="1"></c:set>
				</c:if>


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