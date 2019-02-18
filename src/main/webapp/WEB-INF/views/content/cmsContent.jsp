<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.ats.rusafronend.model.Maintainance"%>


<%
	//allow access only if session exists
	String user = null;
	if (session.getAttribute("menuList") == null) {
		String mapping = (String) session.getAttribute("mapping");
		String contextPath = request.getContextPath();
		contextPath=contextPath+"/retriveSession/"+mapping;
		response.sendRedirect(contextPath); 
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
			<a href="/">Home</a> > <a
				href="${pageContext.request.contextPath}/info/${pageContent.slugName}">${pageContent.pageName}</a>
			>
		</div>
	</div>
	<div class="container" id="main-content">
		<div class="row row-eq-height">
			<div class="col-12 col-sm-3 col-lg-3">
				<div class="leftColm">
					<c:forEach items="${sessionScope.menuList.sectionlist}"
						var="menuList">
						<c:if test="${menuList.sectionId==pageContent.sectioinId}">
							<h3>${menuList.sectionName}</h3>
							<ul class="menu">

								<c:forEach items="${sessionScope.menuList.categoryList}"
									var="catList">

									<c:if test="${catList.sectionId==menuList.sectionId}">

										<li><a
											href="${pageContext.request.contextPath}/info/${catList.slugName}"
											href="cyber-security-courses.html">${catList.catName} </a></li>

										<c:forEach items="${sessionScope.menuList.subCatList}"
											var="subCatList">
											<c:if test="${subCatList.parentId==catList.catId}">
												<li><a
													href="${pageContext.request.contextPath}/info/${subCatList.subSlugName}"
													href="cyber-security-courses.html">${subCatList.subCatName}
												</a></li>
											</c:if>
										</c:forEach>

									</c:if>
								</c:forEach>


							</ul>

						</c:if>
					</c:forEach>

				</div>
			</div>
			<div class="col-12 col-sm-9 col-lg-9 right-Colm">
				<c:set var="find" value="0"></c:set>

				<c:if test="${pageContent.cmsContentList.size()>0}">
					<c:forEach items="${pageContent.cmsContentList}"
						var="cmsContentList">
						<c:if test="${not empty cmsContentList.featuredImage}">
							<img src="${gallryImageURL}${cmsContentList.featuredImage}"
								alt=""
								style="float:${cmsContentList.featuredImageAlignment}; padding-left:20px; padding-right:20px; padding-bottom:20px;"
								height="" width="">
						</c:if>

						<h2>${cmsContentList.heading}</h2>
                    ${cmsContentList.pageDesc}
                    <h6 style="text-align: right;">
							Last Updated on
							<c:choose>
								<c:when test="${not empty cmsContentList.editDate}">${cmsContentList.editDate}</c:when>
								<c:otherwise>${cmsContentList.addDate}</c:otherwise>
							</c:choose>
						</h6>
					</c:forEach>
					<c:set var="find" value="1"></c:set>
				</c:if>

				<c:if test="${pageContent.faqContentList.size()>0}">
					<h2>FAQ's</h2>

					<c:forEach items="${pageContent.faqContentList}"
						var="faqContentList" varStatus="loop">

						<ul>
							<li><strong>${faqContentList.faqQue}</strong><br>
								<div class="clearfix"></div> ${faqContentList.faqAns}</li>
						</ul>
						<c:if test="${loop.last}">
						<h6 style="text-align: right;">
							Last Updated on
							<c:choose>
								<c:when test="${not empty faqContentList.editDate}">${faqContentList.editDate}</c:when>
								<c:otherwise>${faqContentList.addDate}</c:otherwise>
							</c:choose>
						</h6>
						 </c:if>
					</c:forEach>
					<c:set var="find" value="1"></c:set>
				</c:if>

				<c:if test="${pageContent.documentUploadList.size()>0}">
					<h2>Downloads</h2>

					<c:forEach items="${pageContent.documentUploadList}"
						var="documentUploadList">

						<div class="pdfIcon">
							<a href="${url}${documentUploadList.fileName}" target="_blank">${documentUploadList.exVar1}
								- ${documentUploadList.fileSize}</a>
						</div>

					</c:forEach>
					<c:set var="find" value="1"></c:set>
				</c:if>

				<c:if test="${pageContent.testImonialList.size()>0}">
					<h2>Success Stories</h2>
					<div class="row">
						<c:forEach items="${pageContent.testImonialList}"
							var="testImonialList">
							<div class="col-12 col-sm-6 col-lg-6">
								<div class="success-stories">
									${testImonialList.message}
									<p>
										<i><strong>${testImonialList.fromName}</strong></i>
									</p>
								</div>
							</div>
						</c:forEach>
					</div>

					<c:set var="find" value="1"></c:set>
				</c:if>

				<c:if test="${pageContent.gallaryDetailList.size()>0}">

					<div class="row">
						<c:forEach items="${pageContent.gallaryDetailList}"
							var="gallaryDetailList">
							<div class="col-12 col-sm-3 col-lg-3">
								<a href="${gallryImageURL}${gallaryDetailList.fileName}"
									data-toggle="lightbox" data-gallery="plan" data-title=""
									class="thumbnail"> <img
									src="${gallryImageURL}thumbnail${gallaryDetailList.fileName}"
									class="img-responsive"></a>
							</div>
						</c:forEach>
					</div>

					<c:set var="find" value="1"></c:set>
				</c:if>

				<c:if test="${pageContent.detailNewsList.size()>0}">


					<c:forEach items="${pageContent.detailNewsList}"
						var="detailNewsList">
						<div class="row row-eq-height">
							<div class="col-12">
								<img src="${gallryImageURL}${detailNewsList.featuredImage}">
								<c:set var="string1" value="${detailNewsList.descriptions}" />
								<c:set var="string2" value="${fn:substring(string1, 0, 256)}" />
								<h2>${detailNewsList.heading}</h2>
								<p>${string2}</p>
								<a
									href="${pageContext.request.contextPath}/NewsDetails/${detailNewsList.languageId}/${detailNewsList.pageId}/${detailNewsList.newsblogsId}">more
								</a>
							</div>
						</div>
						<h6 style="text-align: right;">
							Last Updated on
							<c:choose>
								<c:when test="${not empty detailNewsList.editDate}">${detailNewsList.editDate}</c:when>
								<c:otherwise>${detailNewsList.addDate}</c:otherwise>
							</c:choose>
						</h6>
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