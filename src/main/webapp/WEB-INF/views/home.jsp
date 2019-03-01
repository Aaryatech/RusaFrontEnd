<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.ats.rusafronend.model.Maintainance"%>


<%
	//allow access only if session exists
	String user = null;
	if (session.getAttribute("menuList") == null) {
		String mapping = (String) session.getAttribute("mapping");
		String contextPath = request.getContextPath();
		contextPath = contextPath + "/retriveSession/" + mapping;
		response.sendRedirect(contextPath);
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description"
	content="${sessionScope.homePageMetaData.metaDescription}">
<meta name="author"
	content="${sessionScope.homePageMetaData.metaAuthor}">
<link rel="icon" href="../../favicon.ico">
<title>${sessionScope.homePageMetaData.siteTitle}</title>
<jsp:include page="/WEB-INF/views/include/meta.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/topBar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/topMenu.jsp"></jsp:include>
	<div class="slider" id="slider">
		<div class="container">
			<h1>${editbanner.sliderName}<br> <span>${editbanner.text1}</span>
			</h1>
			<p>${editbanner.text2}</p>
			<a href="${editbanner.urlLink}" class="btn button "><span>${editbanner.linkName}</span></a>
		</div>
	</div>

	<div class="container main-content" id="main-content">
		<div class="card sub-link">
			<div class="row">
				<c:forEach items="${getCMSDesc}" var="getCMSDesc" varStatus="count">

					<div class="col-12 col-sm-3 col-lg-3">
						<div class="sub-link-icon">
							<img
								src="${pageContext.request.contextPath}/resources/images/icon.jpg"
								alt="">
						</div>
						<c:set var="string1" value="${getCMSDesc.pageDesc}" />
						<c:set var="string2" value="${fn:substring(string1, 0, 256)}" />
						<h2>${getCMSDesc.heading}</h2>
						<p>${string2}
						
						</p>
						<div class="more" style="clear:both">
						<a href="${pageContext.request.contextPath}/info/${getCMSDesc.pageSlug}">more... </a>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-sm-6 col-lg-6">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item nutrition-task-bar-item"><a
						class="nav-link active" data-toggle="tab" href="#update">News And Notification</a></li>

				</ul>
				<div class="tab-content">
					<div id="update" class="tab-pane active">
						<div class="tab-content-section">
							<h5>Digital Launch of Rashtriya Uchchatar Shiksha Abhiyan (RUSA) Projects</h5>
							<p>Digital Launch of Rashtriya Uchchatar Shiksha Abhiyan (RUSA) Projects by Hon’ble Prime Minister on 3rd February 2019 ...</p>
						</div>
						<div class="tab-content-section">
							<h5>15th Meeting of the Project Approval Board</h5>
							<p> 
							PAB meeting to be held on 24th January 2019.  
							Click here to view the minutes of the 15th PAB Meeting Presentation of proposals by institutions approved under component.   ...</p>
						</div>
						<div class="tab-content-section">
							<h5>RUSA Meeting on Preparedness of Digital Launch</h5>
							<p></p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-lg-6">
				<div class="row gallery">

					<c:if test="${photoList.size()>0}">
						<div class="col-12 col-sm-6 col-lg-6">
							<h3>Recent Gallery</h3>
							<div id="carouselExampleControls" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner">

									<c:forEach items="${photoList}" var="editPhotoDetail"
										varStatus="count">

										<c:choose>
											<c:when test="${count.last}">
												<div class="carousel-item active">
													<img
														src="${sessionScope.gallryImageURL}${editPhotoDetail.fileName}"
														width="250" height="228" alt="${editPhotoDetail.title}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="carousel-item">
													<img
														src="${sessionScope.gallryImageURL}${editPhotoDetail.fileName}"
														width="250" height="228" alt="${editPhotoDetail.title}" >
												</div>
											</c:otherwise>
										</c:choose>


									</c:forEach>

								</div>
								<a class="carousel-control-prev" href="#carouselExampleControls"
									role="button" data-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleControls" role="button" data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>

						</div>
					</c:if>

					<div class="col-12 col-sm-6 col-lg-6">
						<h3>Video</h3>
						${videoGalleryDetail[0].fileName} <i
							class="icon-arrow-point-to-right icon"></i>

					</div>
				</div>
			</div>
		</div>
		<div class="row news-section">
			<h2>
				<span>News</span>
			</h2>
			
			<c:forEach items="${newsBlogsList}" var="newsBlogsList"
										varStatus="count">
										<div class="col-12 col-sm-3 col-lg-3">
				<a href="${newsBlogsList.newsSourceUrlName}"><img src="${sessionScope.gallryImageURL}${newsBlogsList.featuredImage}" width="250" height="228" alt="${newsBlogsList.heading}"></a>
				<h5>${newsBlogsList.heading}</h5>
				<c:set var="string4" value="${newsBlogsList.descriptions}" />
				<c:set var="string3" value="${fn:substring(string4, 0, 100)}" />
				<p>${string3}</p>
				<a href="${pageContext.request.contextPath}/NewsDetails/${newsBlogsList.languageId}/${newsBlogsList.pageId}/${newsBlogsList.newsblogsId}">more
				</a>
		</div>
		</c:forEach>
			
			<%-- <div class="col-12 col-sm-3 col-lg-3">
				<img
					src="${pageContext.request.contextPath}/resources/images/news.jpg"
					alt="" class="new-img">
				<p>Lorem Ipsum is simply dummy text of the printing and
					typesetting industry. Lorem Ipsum has been the industry's ...</p>
			</div>
			<div class="col-12 col-sm-3 col-lg-3">
				<img
					src="${pageContext.request.contextPath}/resources/images/news.jpg"
					alt="" class="new-img">
				<p>Lorem Ipsum is simply dummy text of the printing and
					typesetting industry. Lorem Ipsum has been the industry's ...</p>
			</div>
			<div class="col-12 col-sm-3 col-lg-3">
				<img
					src="${pageContext.request.contextPath}/resources/images/news.jpg"
					alt="" class="new-img">
				<p>Lorem Ipsum is simply dummy text of the printing and
					typesetting industry. Lorem Ipsum has been the industry's ...</p>
			</div> --%>
		</div>
		<div class="row bottom-section">
			<div class="col-12 col-sm-3 col-lg-3">
				      <div class="twitter">
                        <a class="twitter-timeline" data-chrome="nofooter" data-widget-id="634609273125732352" data-adapt-container-width="false" data-height="290" href="https://twitter.com/HRDMinistry" tabindex="-1">Tweets by @HRDMinistry</a> 
                        <script>window.twttr = (function(d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0],
                                  t = window.twttr || {};
                                if (d.getElementById(id)) return t;
                                js = d.createElement(s);
                                js.id = id;
                                js.src = "https://platform.twitter.com/widgets.js";
                                fjs.parentNode.insertBefore(js, fjs);
                              
                                t._e = [];
                                t.ready = function(f) {
                                  t._e.push(f);
                                };
                              
                                return t;
                              }(document, "script", "twitter-wjs"));</script>
                    </div>
			</div>
			<div class="col-12 col-sm-3 col-lg-3">
				  <div class="twitter">
                            <div class="fb-page" data-adapt-container-width="false" data-height="290" data-hide-cover="false" data-href="https://www.facebook.com/HRDMinistry/" data-show-facepile="false" data-small-header="true" data-tabs="timeline" data-width="262">
                                <div class="fb-xfbml-parse-ignore">
                                <blockquote cite="https://www.facebook.com/HRDMinistry/"><p>
                                            <a href="https://www.facebook.com/HRDMinistry/">Ministry of Human Resource Development, Government of India</a></p></blockquote>
                                </div>
                    </div>
                    </div>
			</div> 
			<div class="col-12 col-sm-6 col-lg-6">
				<div class="testimonials">
					<h5>TESTIMONIALS</h5>
					<div id="carouselExampleControls2" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner"> 
							  <c:forEach items="${sessionScope.testImonial}" var="testImonial"
								varStatus="count">
								<c:choose>
									<c:when test="${count.last}">
										<div class="carousel-item active">

											<c:if test="${not empty testImonial.imageName}">
												<img
													src="${sessionScope.gallryImageURL}${testImonial.imageName}"
													width="100" height="100" alt="${testImonial.fromName}" class="user">

											</c:if>
											<p>
												<strong>${testImonial.fromName}</strong>
											</p>
											<p>${testImonial.message}</p>
										</div>
									</c:when>
									<c:otherwise>
										<div class="carousel-item ">

											<c:if test="${not empty testImonial.imageName}">
												<img
													src="${sessionScope.gallryImageURL}${testImonial.imageName}"
													width="100" height="100" alt="${testImonial.fromName}" class="user">

											</c:if>
											<p>
												<strong>${testImonial.fromName}</strong>
											</p>
											<p>${testImonial.message}</p>
										</div>

									</c:otherwise>
								</c:choose>
							</c:forEach>  
						</div>
						<a class="carousel-control-prev" href="#carouselExampleControls2"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselExampleControls2"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
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

