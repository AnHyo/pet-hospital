<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<% if(session.getAttribute("id") != null){
	response.sendRedirect("/index");
}
%>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>중앙동물병원</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<style>
.imgdiv {
	position: relative;
	height: 520px;
}

.logoimg {
	position: absolute;
	height: 400px;
	top: 12%;
	left: 10%
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {

		$("#email").hide();

		// 쿠키가져오기
		let userID = getCookie("userID");
		let setCookieYN = getCookie("setCookie");
		if (setCookieYN == 'Y') {
			$("#customCheck").prop("checked", true);
			$("#id").val(userID);
		}

		// email로그인 체크시
		$("#emailLogin").click(function() {
			$("#email").show();
			$("#id").val("");
			$("#pw").val("");
			$("#id").hide();
		});
		// id로그인 체크시
		$("#idLogin").click(function() {
			$("#id").show();
			$("#email").val("");
			$("#pw").val("");
			$("#email").hide();
		});

		// Login버튼 클릭시
		$("#login").click(function() {

			let id = $("#id").val();
			let pw = $("#pw").val();
			let email = $("#email").val();

			if ($("#idLogin").is(":checked")) {
				if ($("#id").val() == "") {
					alert("아이디를 입력하세요.");
					$("#id").focus();
					return false;
				}
			} else if ($("#emailLogin").is(":checked")) {
				// 정규식검사 https://velog.io/@fall031/%EC%A0%95%EA%B7%9C%ED%91%9C%ED%98%84%EC%8B%9D
				let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
				// alert(regex.test($("#email").val()));
				if ($("#email").val() == "") {
					alert("이메일을 입력하세요.");
					$("#email").focus();
					return false;
				} else if (!(regex.test($("#email").val()))) {
					alert("올바른 이메일을 입력하세요.");
					$("#email").focus();
					return false;
				}
			}
			if ($("#pw").val() == "") {
				alert("비밀번호를 입력하세요.");
				$("#pw").focus();
				return false;
			}

			// 아이디저장 체크박스
			if ($("#customCheck").is(":checked")) {
				//alert("아이디저장체크");
				setCookie("userID", id, 7);
				setCookie("setCookie", "Y", 7);
			} else {
				deleteCookie("userID");
				deleteCookie("setCookie");
			}
			
		});
	});

	function setCookie(cookieName, value, exdays) {

		let date = new Date();
		date.setDate(date.getDate() + exdays);

		let cookieValue = escape(value)
				+ (exdays == null ? "" : "; expires=" + date.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;

	}

	function getCookie(cookieName) {

		//alert(document.cookie);
		let val = document.cookie.split(";");
		//alert(val);
		for (let i = 0; i < val.length; i++) {
			let name = val[i].substr(0, val[i].indexOf("="));
			let value = val[i].substr(val[i].indexOf("=") + 1);
			name = name.replace(/^\s+|\s+$/g, '');
			if (cookieName == name) {
				return value;
			}
		}
	}

	function deleteCookie(cookieName) {
		// 쿠키삭제 : 쿠키유지시간을 과거로 바꾸면 됨.
		var date = new Date();
		date.setDate(date.getDate() - 1);
		document.cookie = cookieName + "=" + "; expires=" + date.toGMTString();
	}
</script>

</head>

<body class="bg-gradient-primary">

	<div class="container" style="margin-top: 100px;">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block imgdiv">
								<img src="img/logoda.png" class="logoimg">
							</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center mb-4 mt-4">
										<h1 class="h1 text-gray-900">로그인</h1>
									</div>
									<div class="p-2 row">
										<div class="form-check col-6">
											<input class="form-control-input" type="radio"
												name="flexRadioDefault" id="idLogin" checked> <label
												class="custom-check-label" for="idLogin"> 아이디로 로그인 </label>
										</div>
										<div class="form-check col-6">
											<input class="form-control-input" type="radio"
												name="flexRadioDefault" id="emailLogin"> <label
												class="custom-check-label" for="emailLogin"> 이메일로
												로그인 </label>
										</div>
									</div>
									<form class="user" action="/login" method="post">
										<div>
											<input type="text " class="form-control form-control-user"
												id="id" name="id" placeholder="아이디">
										</div>
										<div>
											<input type="email" class="form-control form-control-user"
												id="email" name="email" placeholder="이메일">
										</div>
										<div class="form-group mt-3">
											<input type="password" class="form-control form-control-user"
												id="pw" name="pw" placeholder="비밀번호">
										</div>
										<div class="form-group ">
											<div class="custom-control custom-checkbox small ">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">아이디
													저장</label>
											</div>
										</div>
										<button type="submit"
											class="btn btn-primary btn-user btn-block" id="login"
											name="login">로그인</button>
									</form>
									<hr>
									<div class="row">
										<div class="text-center col-6">
											<a class="small" href="#" onclick="location.href='/findPW'">비밀번호
												찾기</a>
										</div>
										<div class="text-center col-6">
											<a class="small" href="#" onclick="location.href='/join'">가입하기</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<c:if test="${param.error eq 4321 }">
		<script type="text/javascript">
			alert("로그인 후 이용해주세요");		
		</script>
	</c:if>
	<c:if test="${param.error eq 1111}">
		<script>
			alert("확인되지 않는 사용자입니다. 다시 로그인해주세요.");
		</script>
	</c:if>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

</body>


</html>