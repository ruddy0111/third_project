<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page contentType="text/html;charset=UTF-8"%>
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
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/client/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="/resources/client/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Nemo Recipe</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="/resources/client/assets/css/material-kit.css"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/resources/client/assets/demo/demo.css" rel="stylesheet" />


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<script>
	$(function() {
		$("button[name='registbutton']").click(function() {
			registbt();
		})
	});

	function registbt() {
		//서버에 등록요청
		$("form").attr({
			"action" : "/client/regist_recipe",
			"method" : "post",
			"enctype" : "multipart/form-data"
		});
		$("form").submit();
	}

	$(document)
			.ready(
					function() {
						$('.btnAdd')
								.click(
										function() {
											$('.buttons')
													.append(
															'<input name="recipe_ingredient" type="text" placeholder="예) 소스 / 재료" onclick="" /> <input	name="recipe_ingredient" type="text" placeholder="예) 3큰술 / 600g" onclick="" /> <input type="button" class="btnRemove" value="─"><br>'); // end append                            
											$('.btnRemove')
													.on(
															'click',
															function() {
																$(this)
																		.prev()
																		.remove(); // remove the textbox
																$(this)
																		.prev()
																		.remove(); // remove the textbox																		
																$(this)
																		.next()
																		.remove(); // remove the <br>
																$(this)
																		.remove(); // remove the button
															});
										}); // end click                                            
					}); // end ready
</script>

</head>

<body class="index-page sidebar-collapse">

	<!-- navi -->
	<%@ include file="inc/top_navi.jsp"%>
	<!-- navi -->
	<div class="page-header header-filter clear-filter purple-filter"
		data-parallax="true" style="background-color: white;">
		<!-- NEMO LOGO TITLE -->
		<div class="logo_face"></div>
		<div class="logo_title"></div>
	</div>
	<form>
		<!-- 메인 div -->
		<div class="main main-raised">
			<div class="section section-basic">
				<div class="container">
					
				</div>
			</div>
		</div>
	</form>
	<!-- 하단부 내용 -->
	<div class="title"></div>
	</div>
	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>
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
	<script>
		$(document).ready(function() {
			//init DateTimePickers
			materialKit.initFormExtendedDatetimepickers();

			// Sliders Init
			materialKit.initSliders();
		});

		function scrollToDownload() {
			if ($('.section-download').length != 0) {
				$("html, body").animate({
					scrollTop : $('.section-download').offset().top
				}, 1000);
			}
		}
	</script>


	<!-- 등록폼 관련 시작-->
	<!-- jQuery -->
	<script src="/resources/client/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="/resources/client/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- bs-custom-file-input -->
	<script
		src="/resources/client/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/client/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/client/dist/js/demo.js"></script>


</body>

</html>