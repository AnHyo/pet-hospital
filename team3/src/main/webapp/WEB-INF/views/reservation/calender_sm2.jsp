<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko">
<%
if (session.getAttribute("id") == null) {
	response.sendRedirect("/login?error=4321");
}
%>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>캘린더</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />
<link rel="stylesheet" href="css/reservation/calender_sm2.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="https://kit.fontawesome.com/a31e2023c3.css"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/a31e2023c3.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="css/reservation/reserv.css" rel="stylesheet">
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/resources/assets/favicon.ico" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="css/reservation/calender_sm.css">
<link rel="stylesheet" href="css/reservation/calender_sm2.css">
<link rel="stylesheet" href="css/reservation/reserv.css">
</head>
<script type="text/javascript">
	
</script>
<style type="text/css">
.form-inline {
	display: flex;
	flex-flow: row wrap;
	align-items: center;
}

.form-control {
	display: inline-block;
	width: 100%;
	vertical-align: middle;
}

.marginTop5 {
	margin-top: -1rem;
}

.disabled {
	color: #616161 !important;
}

#accordion {
	width: 440px;
}

#add-button:hover {
	/* color: white; */
	background-color: #4e73df;
}
</style>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@ include file="../bar/sideBar.jsp"%>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<%@ include file="../bar/topBar.jsp"%>
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<div class="content" style="padding-right: -20px;">
						<div class="calendar-container">
							<div class="calendar">
								<div class="year-header" >
									<span class="left-button" id="prev" style="height:100%;"> &lang; </span> <span
										class="year" id="label"></span> <span class="right-button"  style="height:100%;"
										id="next"> &rang; </span>
								</div>
								<table class="months-table"
									style="width: 100%; padding-left: 5px; padding-right: 5px;">
									<tbody style="border-width: 10px;">
										<tr class="months-row">
											<td class="month"><span style="font-size: 15px;">1</span>월</td>
											<td class="month"><span style="font-size: 15px;">2</span>월</td>
											<td class="month"><span style="font-size: 15px;">3</span>월</td>
											<td class="month"><span style="font-size: 15px;">4</span>월</td>
											<td class="month"><span style="font-size: 15px;">5</span>월</td>
											<td class="month"><span style="font-size: 15px;">6</span>월</td>
											<td class="month"><span style="font-size: 15px;">7</span>월</td>
											<td class="month"><span style="font-size: 15px;">8</span>월</td>
											<td class="month"><span style="font-size: 15px;">9</span>월</td>
											<td class="month"><span style="font-size: 15px;">10</span>월</td>
											<td class="month"><span style="font-size: 15px;">11</span>월</td>
											<td class="month"><span style="font-size: 15px;">12</span>월</td>
										</tr>
									</tbody>
								</table>

								<table class="days-table">
									<td class="day">일</td>
									<td class="day">월</td>
									<td class="day">화</td>
									<td class="day">수</td>
									<td class="day">목</td>
									<td class="day">금</td>
									<td class="day">토</td>
								</table>
								<div class="frame">
									<table class="dates-table" style="width: 100%;">
										<tbody class="tbody">
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<!-- 리스트 띄우기 -->
						<div class="dialog2" id="dialog2">

							<!-- 검색 -->
							<!-- 검색창 / 예약창 / 접수창 -->
							<div class="row no-gutters">
								<!-- 검색 -->
								<div class="col-xl-6">
									<div class="card">
										<!--메뉴1 -->
										<div
											class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
											<h6 class="m-0 font-weight-bold text-primary">고객조회</h6>
										</div>
										<div class="card-body p-3"
											style="height: 640px; overflow: auto;">
											<!-- 검색기능 -->
											<div class="input-group mb-2">
												<input type="text"
													class="form-control form-control-sm border-gray col-md-12"
													placeholder="이름 혹은 전화번호" aria-label="검색"
													name="search_value" id="search_value">
												<div class="input-group-append">
													<button class="btn btn-primary btn-sm" type="button"
														id="search_btn">
														<i class="fas fa-search"></i>
													</button>
												</div>
											</div>

											<table class="table table-borderless"
												style="color: gray; background-color: white;">
												<tbody id="researchTable">
													<c:forEach items="${boardlist}" var="s">
														<tr class="search_result"
															style="border-bottom: 1px solid gray; padding-bottom: 5px;">
															<td style="font-size: 14px;">
																<div>
																	<a style="text-decoration: none;"><b
																		style="font-size: 25px; color: black">${s.pet_name}</b></a>&nbsp;&nbsp;&nbsp;${s.owner_name}
																</div> <br>

																<div>
																	<span>${s.type_name} | ${s.pet_birth} |
																		${s.pet_gender}</span>
																</div>
															</td>
															<td style="text-align: right; width: 140px;"><span></span><br>
																<br> <span> <input type="hidden"
																	id="search_ownerNo" class="search_ownerNo1"
																	value="${s.owner_no}">
																	<button type="button" class="btn btn-sm reserv_btn"
																		value="${s.pet_no}"
																		style="border: 1px solid #0d6efd; color: #0d6efd;">예약</button>
															</span></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>

								<!-- 예약 -->
								<div class="col-xl-6">
									<div class="card">
										<!-- title -->
										<div class="card-header py-3">
											<h6 class="m-0 font-weight-bold text-primary">예약</h6>
										</div>
										<div class="card-body p-3"
											style="height: 640px; overflow: auto;">

											<table class="table table-borderless"
												style="color: gray; background-color: white;">
												<tbody id="reservTable">
<%-- 													<c:choose> --%>
<%-- 														<c:when test="${fn:length(reservationview2) eq 0}"> --%>
<!-- 															<tr class='text-center'> -->
<!-- 																<td colspan='4'>예약내역이 존재하지 않습니다.</td> -->
<!-- 															</tr> -->
<%-- 														</c:when> --%>
<%-- 														<c:otherwise> --%>

<%-- 															<c:forEach items="${reservationview2}" var="l"> --%>
<!-- 																<input type="hidden" id="age"> -->
<!-- 																<tr -->
<!-- 																	style="border-bottom: 1px solid gray; padding-bottom: 5px;"> -->
<!-- 																	<td style="font-size: 14px;"> -->
<!-- 																		<div style=""> -->
<!-- 																			<a style="text-decoration: none;"><b -->
<!-- 																				style="font-size: 25px; color: black"> -->
<%-- 																					${l.pet_name}</b></a>&nbsp;&nbsp;&nbsp;${l.owner_name}&nbsp; --%>
<%-- 																			<a class="reservUpdate" value="${l.reservation_no}" --%>
<!-- 																				style="text-decoration: none;"> <i -->
<!-- 																				class="xi-file-text-o"></i> -->
<!-- 																			</a> -->
<!-- 																		</div> <br> -->
<!-- 																		<div> -->
<%-- 																			<span>${l.type_name} | ${l.pet_birth} | --%>
<%-- 																				${l.pet_gender}</span> --%>
<%-- 																		</div> <span> ${l.reservation_memo} </span> --%>
<%-- 																	<td style="text-align: right;"><span><b><h5>${l.reserv_time}</h5></b></span><br> --%>
<%-- 																		<input type="hidden" id="petNo" value="${l.pet_no}"> --%>
<!-- 																		<input type="hidden" id="ownerNo" -->
<%-- 																		value="${l.owner_no}"> <input type="hidden" --%>
<%-- 																		id="reservation_Yn" value="${l.reservation_yn}"> --%>
<!-- 																		<span> -->
																		
<%-- 																		<c:if test="${l.receive_state eq '1' || l.receive_state eq '2'}"> --%>
<!-- 																			<button type="button" -->
<!-- 																				class="btn btn-secondary btn-sm reserv_cancel" -->
<%-- 																				value="${l.reservation_no}" --%>
<!-- 																				style="background-color: #7f8c8d; border: none;">취소</button> -->
<%-- 																		</c:if> --%>
<!-- 																	</span></td> -->
<!-- 																</tr> -->
<%-- 															</c:forEach> --%>
<%-- 														</c:otherwise> --%>
<%-- 													</c:choose> --%>
												</tbody>
											</table>

										</div>
									</div>
								</div>

							</div>
							<!-- row끝 -->
						</div>
						<!-- dialog 끝 -->
					</div>
				</div>
			</div>
			<%@ include file="../bar/footer.jsp"%>
			<%@ include file="../bar/logoutModal.jsp"%>
			<%@ include file="reservation_modal.jsp"%>
		</div>
	</div>

	<!-- 시간선택 html -->
	<div style="display: none;">
		<div class="timeoption">
			<label class="col-form-label" for="update_reservation_date_time">예약시간</label>
			<div class="accordion" id="accordionExample">
				<div class="accordion-item" style="width: 457px;">
					<button class="accordion-button collapsed"
						style="height: 38px; width: 455px; border: 1px solid #d1d3e2;"
						type="button" id="accordion" data-bs-toggle="collapse"
						data-bs-target="#collapseOne" aria-expanded="false"
						aria-controls="collapseOne">시간선택</button>
					<div id="collapseOne" class="accordion-collapse collapse"
						aria-labelledby="headingOne" style="margin-top: 10px;"
						data-bs-parent="#accordionExample">
						<div class="accordion-body1">
							<div class="row text-center mx-0" id="timeAppend">
								<div class="col-md-3 col-4 my-1 px-2">
									<input type="radio" class="btn-check t1" name="reserv_time"
										value="09:00" id="btn-check-2-outlined1" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined1">09:00</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2">
									<input type="radio" class="btn-check t2" name="reserv_time"
										value="09:30" id="btn-check-2-outlined2" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined2">09:30</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2">
									<input type="radio" class="btn-check t3" name="reserv_time"
										value="10:00" id="btn-check-2-outlined3" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined3">10:00</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2">
									<input type="radio" class="btn-check t4" name="reserv_time"
										value="10:30" id="btn-check-2-outlined4" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined4">10:30</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2">
									<input type="radio" class="btn-check t5" name="reserv_time"
										value="11:00" id="btn-check-2-outlined5" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined5">11:00</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2">
									<input type="radio" class="btn-check t6" name="reserv_time"
										value="11:30" id="btn-check-2-outlined6" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined6">11:30</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2">
									<input type="radio" class="btn-check t7" name="reserv_time"
										value="13:00" id="btn-check-2-outlined7" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined7">13:00</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2">
									<input type="radio" class="btn-check t8" name="reserv_time"
										value="13:30" id="btn-check-2-outlined8" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined8">13:30</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2">
									<input type="radio" class="btn-check t9" name="reserv_time"
										value="14:00" id="btn-check-2-outlined9" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined9">14:00</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2">
									<input type="radio" class="btn-check t10" name="reserv_time"
										value="14:30" id="btn-check-2-outlined10" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined10">14:30</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2 ">
									<input type="radio" class="btn-check t11" name="reserv_time"
										value="15:00" id="btn-check-2-outlined11" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined11">15:00</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2 ">
									<input type="radio" class="btn-check t12" name="reserv_time"
										value="15:30" id="btn-check-2-outlined12" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined12">15:30</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2 ">
									<input type="radio" class="btn-check t13" name="reserv_time"
										value="16:00" id="btn-check-2-outlined13" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined13">16:00</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2 ">
									<input type="radio" class="btn-check t14" name="reserv_time"
										value="16:30" id="btn-check-2-outlined14" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined14">16:30</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2 ">
									<input type="radio" class="btn-check t15" name="reserv_time"
										value="17:00" id="btn-check-2-outlined15" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined15">17:00</label>
								</div>
								<br>
								<div class="col-md-3 col-4 my-1 px-2 ">
									<input type="radio" class="btn-check t16" name="reserv_time"
										value="17:30" id="btn-check-2-outlined16" autocomplete="off">
									<label class="btn btn-outline-primary"
										for="btn-check-2-outlined16">17:30</label>
								</div>
								<br>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 수정Modal -->
	<div class="modal fade" id="updateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">수정하기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="row g-4 form">
						<div class="col-md-6">
							<label for="update_owner_name" class="col-form-label">보호자
								이름</label> <input type="text" class="form-control"
								id="update_owner_name" value="없음" readonly>
						</div>
						<div class="col-md-6">
							<label for="update_owner_tel" class="col-form-label">전화번호</label>
							<input type="text" class="form-control" id="update_owner_tel"
								placeholder="01012345678" value="없음" readonly>
						</div>
						<div class="col-md-6">
							<label for="update_pet_name" class="col-form-label">반려견
								이름</label> <input type="text" class="form-control" id="update_pet_name"
								value="없음" readonly>
						</div>
						<div class="col-md-6">
							<label for="update_pet_gender" class="col-form-label">반려견
								성별</label> <input type="text" class="form-control"
								id="update_pet_gender" value="없음" readonly>
						</div>
						<div class="col-md-6">
							<label for="update_pet_birth" class="col-form-label">반려견
								출생년도</label> <input type="text" class="form-control"
								id="update_pet_birth" value="없음" readonly>
						</div>
						<!-- 예약시간 -->
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<c:set var="minDate">
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
						</c:set>
						<p class="col-md-6">
							<label for="update_reservation_date_day" class="col-form-label">예약날짜</label><br>
							<input class="form-control" type="date" value="2023-01-01"
								min="<c:out value="${minDate}"/>"
								id="update_reservation_date_day" tabindex="-1">
						</p>

						<!-- 시간설정 -->
						<div class="updatetimeset" style="width: auto;"></div>
						<input type="hidden" id="reservation_date" name="reservation_date">
						<div class="mb-3">
							<label for="update_reservation_memo" class="col-form-label">예약메모</label>
							<textarea class="form-control" id="update_reservation_memo" style="resize:none;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal" id="update_cancel-button">취소</button>
							<button type="button" class="btn btn-primary"
								id="update_ok-button" value="">수정하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<!-- Dialog Box-->
<script src="js/reservation/calender_sm2.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous">
</script>