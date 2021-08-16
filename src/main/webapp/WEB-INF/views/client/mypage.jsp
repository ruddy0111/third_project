<!--
=========================================================
Material Kit - v2.0.7
=========================================================
Product Page: https://www.creative-tim.com/product/material-kit
Copyright 2020 Creative Tim (https://www.creative-tim.com/)
Coded by Creative Tim
=========================================================
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<!DOCTYPE html>
<%@page import="com.koreait.nemorecipe.domain.Recipe"%>
<%@page import="com.koreait.nemorecipe.domain.Member"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<%List<Recipe> recipeList = (List)request.getAttribute("recipeList");%>
<html lang="en">
<head>
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/client/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="/resources/client/assets/img/favicon.png">

<!-- Style -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/css/fresh-bootstrap-table.css" rel="stylesheet" />

<!-- Fonts and icons -->
<link href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Roboto:400,700,300"
	rel="stylesheet" type="text/css">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


<title>Nemo Recipe Mypage</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="/resources/client/assets/css/material-kit.css?v=2.0.7"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/resources/client/assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="profile-page sidebar-collapse">

	<%@ include file="inc/top_navi.jsp"%>
	<div class="page-header header-filter clear-filter purple-filter"
		data-parallax="true" style="background-color: white;">
		<!-- NEMO LOGO TITLE -->
		<div class="logo_face"></div>
		<div class="logo_title"></div>
	</div>
	<div class="main main-raised">
		<div class="profile-content">
			<div class="container">
				<div class="row">
					<div class="col-md-6 ml-auto mr-auto">
						<div class="profile">
							<div class="avatar">
								<img
									src="/resources/client/assets/img/nemo_logo/nemo_logo_face_white.jpg"
									alt="Circle Image" class="img-raised rounded-circle img-fluid">
							</div>
							<div class="name">
								<h1 class="title"><%=member.getUser_nickname()%></h1>
								<a href="#pablo" class="btn btn-just-icon btn-link btn-dribbble"><i
									class="fa fa-dribbble"></i></a> <a href="#pablo"
									class="btn btn-just-icon btn-link btn-twitter"><i
									class="fa fa-twitter"></i></a> <a href="#pablo"
									class="btn btn-just-icon btn-link btn-pinterest"><i
									class="fa fa-pinterest"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="description text-center">
				<p>자기소개를 작성해 주세요</p>
			</div>

			<div class="row">
				<div class="col-md-6 ml-auto mr-auto">
					<div class="profile-tabs">
						<ul class="nav nav-pills nav-pills-icons justify-content-center"
							role="tablist">

							<li class="nav-item"><a class="nav-link active"
								href="#MyRecipe" role="tab" data-toggle="tab"> <i
									class="material-icons">camera</i> My Recipe
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#comment"
								role="tab" data-toggle="tab"> <i class="material-icons">palette</i>
									comment
							</a></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="tab-content tab-space">
				<!-- My Recipe -->
		<div class="tab-pane active text-center gallery" id="MyRecipe">
		
			<div class="row" style="position: relative; margin-left: 200px;" >
				
		        <%for(Recipe recipe : recipeList){ %>
		
		        <div style="width: 200px; height: 370px; float: left; margin: 0px 2.5rem; margin-left: 2.5rem; text-align: center; cursor: pointer;" onClick="location.href='/client/detail?recipe_id=<%=recipe.getRecipe_id()%>';">
		        	<%if(recipe.getRecipe_img().equals("none")){ %>
		        	<img src="/resources/client/assets/img/noimage.jpg" alt="Rounded Image" class="rounded img-fluid" style="width: 200px; height: 200px">
		        	<%}else{ %>
		          	<img src="/resources/data/<%=recipe.getRecipe_img() %>" alt="Rounded Image" class="rounded img-fluid" style="width: 200px; height: 200px">
		          	<%} %>
		          	<h3 class="title" style="text-align: center;"><%=recipe.getRecipe_name() %></h3>
		          	<h4 style="text-align: right; color: #00bcd4"><%=recipe.getMember().getUser_nickname() %> / <%=recipe.getRecipe_date() %></h4>
		        </div>
		        
		        <%} %>
	        
	        
	      </div>
				
				</div>

				<!-- comment -->

				<div class="tab-pane text-center gallery" id="comment">

					<div class="fresh-table toolbar-color-blue">
						<!--
    Available colors for the full background: full-color-blue, full-color-azure, full-color-green, full-color-red, full-color-orange
    Available colors only for the toolbar: toolbar-color-blue, toolbar-color-azure, toolbar-color-green, toolbar-color-red, toolbar-color-orange
  -->


						<table id="fresh-table" class="table">
							<thead>
								<tr>
									<th data-field="id">No</th>
									<th data-field="name">Comments</th>
									<th data-field="salary">Date</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>맛있어!</td>
									<td>2012</td>
								</tr>
								<tr>
									<td>2</td>
									<td>이건 너무 별론데</td>
									<td>2012</td>
								</tr>
								<tr>
									<td>3</td>
									<td>만들기 좀 어렵네요 ㅎ</td>
									<td>2012</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- Footer -->
    <%@ include file="inc/footer.jsp" %>
    <!-- Footer End -->


	
	<!--   Core JS Files   -->
	<script src="/resources/client/assets/js/core/jquery.min.js"
		type="text/javascript"></script>
	<script src="/resources/client/assets/js/core/popper.min.js"
		type="text/javascript"></script>
	<script
		src="/resources/client/assets/js/core/bootstrap-material-design.min.js"
		type="text/javascript"></script>
	<script src="/resources/client/assets/js/plugins/moment.min.js"></script>
	<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
	<script
		src="/resources/client/assets/js/plugins/bootstrap-datetimepicker.js"
		type="text/javascript"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="/resources/client/assets/js/plugins/nouislider.min.js"
		type="text/javascript"></script>
	<!--  Google Maps Plugin    -->
	<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
	<script src="/resources/client/assets/js/material-kit.js?v=2.0.7"
		type="text/javascript"></script>
</body>

</html>
			