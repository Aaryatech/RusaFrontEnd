<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<div class="top-menu" id="top-menu">
	<div>
		<div class="navbar navbar-expand-md ">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
					src="${logoUrl}${logo.logoMain}"
					alt=""></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarsExample01" aria-controls="navbarsExample01"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<form class="form-inline my-2 my-md-0"
					action="${pageContext.request.contextPath}/searchData" method="get">
					<input class="form-control" type="text" placeholder="Search"
						name="word">
					<button type="submit" id="contact-btn" class="btn button search">
						<span class="icon-search icon"></span>
					</button>
				</form>
			</div>
		</div>

		<nav class="navbar navbar-expand-md bg-dark">
			<div class="container">
				<div class="collapse navbar-collapse" id="navbarsExample01">
					<ul class="navbar-nav mr-end">
						<c:forEach items="${sessionScope.menuList}" var="menuList">
							<li class="nav-item dropdown"><c:choose>
									<c:when test="${menuList.catList.size()>0}">

										<a
											href="${pageContext.request.contextPath}/info/${menuList.sectionSlugname}"
											class="dropdown-toggle nav-link dropdown-toggle"
											data-toggle="dropdown">${menuList.sectionName} <span
											class="caret"></span></a>
										<ul class="dropdown-menu">
											<c:forEach items="${menuList.catList}" var="catList">
												<c:choose>
													<c:when test="${catList.subCatList.size()>0}">
														<li class="dropdown-submenu">
														<c:choose>
																<c:when test="${not empty catList.externalUrl}">
																	<a class="test" tabindex="-1"
																		href="${pageContext.request.contextPath}/${catList.externalUrl}">${catList.catName}<span
																		class="caret"></span></a>
																</c:when>
																<c:otherwise>
																	<a class="test" tabindex="-1"
																		href="${pageContext.request.contextPath}/info/${catList.slugName}">${catList.catName}<span
																		class="caret"></span></a>
																</c:otherwise>
															</c:choose>

															<ul class="dropdown-menu">
																<c:forEach items="${catList.subCatList}"
																	var="subCatList">
																	<li class="dropdown-item">
																	<c:choose>
																			<c:when test="${not empty catList.externalUrl}">
																				<a class="test"
																					href="${pageContext.request.contextPath}/${subCatList.externalUrl}">${subCatList.subCatName}
																				</a>
																			</c:when>
																			<c:otherwise>
																				<a class="test"
																					href="${pageContext.request.contextPath}/info/${subCatList.subSlugName}">${subCatList.subCatName}
																				</a>
																			</c:otherwise>
																		</c:choose></li>
																</c:forEach>
															</ul>
															
														</li>
														
													</c:when>
													<c:otherwise>
														<li class="dropdown-item"><c:choose>
																<c:when test="${not empty catList.externalUrl}">
																	<a class="test" tabindex="-1"
																		href="${pageContext.request.contextPath}/${catList.externalUrl}">${catList.catName}<span
																		class="caret"></span></a>
																</c:when>
																<c:otherwise>
																	<a class="test" tabindex="-1"
																		href="${pageContext.request.contextPath}/info/${catList.slugName}">${catList.catName}<span
																		class="caret"></span></a>
																</c:otherwise>
															</c:choose></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</ul>
									</c:when>
									<c:otherwise>
										<a class="nav-link"
											href="${pageContext.request.contextPath}/info/${menuList.sectionSlugname}">${menuList.sectionName}</a>
									</c:otherwise>
								</c:choose></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</div>
