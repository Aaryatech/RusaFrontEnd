<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
	<title>Home</title>
</head>
<body>
 <!DOCTYPE html>
<html lang="en">
    <head>
       
       <jsp:include page="/WEB-INF/views/include/meta.jsp"></jsp:include>
    </head>
    <body>
         
         <jsp:include page="/WEB-INF/views/include/topBar.jsp"></jsp:include>
         <jsp:include page="/WEB-INF/views/include/topMenu.jsp"></jsp:include>
         <div class="slider">
            <div class="container">
                <h1>Rashtriya Uchchatar Shiksha Abhiyan<br>
                    <span>Government of Maharashtra</span>
                </h1>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                <a href="#" class="btn button "><span>Read More</span></a>
            </div>
        </div>
       
        <div class="container">
            <div class="card sub-link">
                <div class="row">
                    <div class="col-12 col-sm-3 col-lg-3">
                        <div class="sub-link-icon"><img src="${pageContext.request.contextPath}/resources/images/icon.jpg" alt=""></div>
                        <h2>Autonomy</h2>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ...</p>
                    </div>
                    <div class="col-12 col-sm-3 col-lg-3">
                        <div class="sub-link-icon"><img src="${pageContext.request.contextPath}/resources/images/icon.jpg" alt=""></div>
                        <h2>Naac  Accreditation</h2>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ...</p>
                    </div>
                    <div class="col-12 col-sm-3 col-lg-3">
                        <div class="sub-link-icon"><img src="${pageContext.request.contextPath}/resources/images/icon.jpg" alt=""></div>
                        <h2>Excellence</h2>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ...</p>
                    </div>
                    <div class="col-12 col-sm-3 col-lg-3">
                        <div class="sub-link-icon"><img src="${pageContext.request.contextPath}/resources/images/icon.jpg" alt=""></div>
                        <h2>Grants</h2>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ...</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-6 col-lg-6">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item nutrition-task-bar-item">
                            <a class="nav-link active" data-toggle="tab" href="#update">Update</a>
                        </li>
                        <li class="nav-item nutrition-task-bar-item">
                            <a class="nav-link" data-toggle="tab" href="#circular">Circular</a>
                        </li>
                        <li class="nav-item nutrition-task-bar-item">
                            <a class="nav-link" data-toggle="tab" href="#press-releases">Press Releases</a>
                        </li>
                        <li class="nav-item nutrition-task-bar-item">
                            <a class="nav-link" data-toggle="tab" href="#advertisment">Advertisment</a>
                        </li>
                        <li class="nav-item nutrition-task-bar-item">
                            <a class="nav-link" data-toggle="tab" href="#achievements">Achievements</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="update" class="tab-pane active">
                            <div class="tab-content-section">
                                <h5>Lorem Ipsum is simply</h5>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ...</p>
                            </div>
                            <div class="tab-content-section">
                                <h5>Lorem Ipsum is simply</h5>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ...</p>
                            </div>
                            <div class="tab-content-section">
                                <h5>Lorem Ipsum is simply</h5>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ...</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-6">
                    <div class="row gallery">
                        <div class="col-12 col-sm-6 col-lg-6">
                            <h3>Award Gallery</h3>
                            <img src="${pageContext.request.contextPath}/resources/images/gallery.jpg" alt="">
                        </div>
                        <div class="col-12 col-sm-6 col-lg-6">
                            <h3>Teacher's Day 2018</h3>
                            <img src="${pageContext.request.contextPath}/resources/images/video.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row news-section">
                <h2><span>News</span> </h2>
                <div class="col-12 col-sm-3 col-lg-3">
                    <img src="${pageContext.request.contextPath}/resources/images/news.jpg" alt="" class="new-img">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ...</p>
                </div>
                <div class="col-12 col-sm-3 col-lg-3">
                    <img src="${pageContext.request.contextPath}/resources/images/news.jpg" alt="" class="new-img">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ...</p>
                </div>
                <div class="col-12 col-sm-3 col-lg-3">
                    <img src="${pageContext.request.contextPath}/resources/images/news.jpg" alt="" class="new-img">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ...</p>
                </div>
                <div class="col-12 col-sm-3 col-lg-3">
                    <img src="${pageContext.request.contextPath}/resources/images/news.jpg" alt="" class="new-img">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ...</p>
                </div>
            </div>
            <div class="row bottom-section">
                <div class="col-12 col-sm-3 col-lg-3">
                    <p><strong>Schemes</strong></p>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                    <div class="divider"></div>
                    <p><strong>Forms</strong></p>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                    <a href="#" class="btn download-form"><span>Download Forms</span></a>
                </div>
                <div class="col-12 col-sm-3 col-lg-3">
                    <p><strong>Fundamental Core Values</strong></p>
                    <br>
                    <img src="${pageContext.request.contextPath}/resources/images/news.jpg" alt="" class="new-img">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ...</p>
                    <a href="#" class="btn download-form read-more"><span>Read More</span></a>
                </div>
                <div class="col-12 col-sm-6 col-lg-6">
                    <div class="testimonials">
                        <h5>TESTIMONIALS</h5>
                        <img src="${pageContext.request.contextPath}/resources/images/user.png" alt="" class="user">
                        <p><strong>Lorem ipusm</strong></p>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industryspecimen book Lorem Ipsum is simply dummy text of the printing and typesetting industryspecimen book...</p>
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
</body>
</html>
