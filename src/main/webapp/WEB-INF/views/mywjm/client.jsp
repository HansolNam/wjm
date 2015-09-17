<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.AccountInfo"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");

%>
<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>외주몬(WJM) · 마이외주몬</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static//CACHE/css/aa41eeaffc60.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css" media="all"
	rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/a52a868564de.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/resources/static/css/floating.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath}/resources/static/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/static/favicon.ico" rel="icon" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad.png" rel="apple-touch-icon"
	sizes="76x76" />
<link href="${pageContext.request.contextPath}/resources/static/touch-icon-iphone-retina.png" rel="apple-touch-icon"
	sizes="120x120" />
<link href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad-retina.png" rel="apple-touch-icon"
	sizes="152x152" />
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/cb793deb7347.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/CACHE/js/c3617c8217d0.js" type="text/javascript"></script>
</head>
<body class="logged-in client mywishket">
	<div id="wrap">
	<jsp:include page="../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						마이외주몬 <small class="small-text"><a href="/wjm/client-use/">처음
								오셨나요? 이용방법을 확인하세요 <i class="fa fa-chevron-right"></i>
						</a></small>
					</h3>
				</div>
				<div class="content-inner">
					<div class="notice">
						<h4 class="notice-heading">공지사항</h4>
						<ul class="notice-list list-unstyled">
							<li><span class="label label-notice">새소식</span> <a
								href="http://goo.gl/1DCKCs" target="_blank">[업데이트] 파트너 프로필
									페이지 리뉴얼 - 평가 및 데이터 차트화</a> <span class="notice-date">2015.
									08. 20</span></li>
							<li><a href="http://goo.gl/SLa1uy" target="_blank">CEO의
									입장에서 바라본 원격 근무의 장점</a> <span class="notice-date">2015. 05.
									04</span></li>
							<li><a
								href="http://blog.wishket.com/%EC%9C%84%EC%8B%9C%EC%BC%93-%EB%8C%80%EA%B8%88-%EB%B3%B4%ED%98%B8%EB%A5%BC-%ED%86%B5%ED%95%B4-%EC%8B%A0%EB%A2%B0%ED%95%A0-%EC%88%98-%EC%9E%88%EB%8A%94-%EA%B3%84%EC%95%BD%EC%9D%"
								target="_blank">[인터뷰] “대금 보호를 통해 신뢰할 수 있는 계약을 할 수 있었습니다</a> <span
								class="notice-date">2015. 01. 09</span></li>
						</ul>
					</div>
					<div class="mywishket-project">
						<h4 class="mywishket-project-heading">내 프로젝트</h4>
						<div class="submitted-project">
							<h5 class="submitted-project-heading">
								<a href="/wjm/client/manage/project/submitted/">검수 중</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>프로젝트 제목</th>
										<th>제출일자</th>
										<th>도구</th>
									</tr>
								</thead>
								<!-- 
								<tbody><tr><td>ㅁㅁㅁ</td><td>2015년 9월 15일</td><td><a class="btn btn-sm btn-client" href="/project/preview/%E1%84%86%E1%84%86%E1%84%86_4871/">미리보기</a></td></tr></tbody>
								 -->
								<tbody>
									<tr>
										<td class="text-muted" colspan="3">검수 중인 프로젝트가 없습니다.</td>
									</tr>
								</tbody>
							</table>
							<p class="text-right">
								<a class="more" href="/wjm/client/manage/project/submitted/">더
									자세히 보기 <i class="fa fa-chevron-right"></i>
								</a>
							</p>
						</div>
						<div class="proposal-project">
							<h5 class="proposal-project-heading">
								<a href="/wjm/client/manage/recruiting/">지원자 모집 중</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>프로젝트 제목</th>
										<th>마감일자</th>
										<th>지원자 수</th>
										<th>도구</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-muted" colspan="4">모집 중인 프로젝트가 없습니다.</td>
									</tr>
								</tbody>
							</table>
							<p class="text-right">
								<a class="more" href="/wjm/client/manage/recruiting/">더 자세히 보기 <i
									class="fa fa-chevron-right"></i></a>
							</p>
						</div>
						<div class="contract-project">
							<h5 class="contract-project-heading">
								<a href="/wjm/client/manage/contract-in-progress/">진행 중인 프로젝트</a>
							</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>프로젝트 제목</th>
										<th>파트너스</th>
										<th>금액</th>
										<th>남은기간/기간</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-muted" colspan="6">진행 중인 프로젝트가 없습니다.</td>
									</tr>
								</tbody>
							</table>
							<p class="text-right">
								<a class="more" href="/wjm/client/manage/contract-in-progress/">더
									자세히 보기 <i class="fa fa-chevron-right"></i>
								</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<div class="inner">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">클라이언트</h3>
						<div class="user-name-tag-body">
							<img alt="gksthf1611 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/static/img/default_avatar.png" />
							<h4 class="username"><%=account.getId() %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="project-add-suggestion">
						<h5 class="suggestion-text">
							무료로 프로젝트를<br />등록해 보세요
						</h5>
						<a class="btn btn-client btn-lg btn-project-add"
							href="/wjm/project/add/">프로젝트 등록하기</a>
					</div>
					<div class="client-history">
						<h3 class="client-history-heading">위시켓 히스토리</h3>
						<div class="client-history-body">
							<div class="project">
								<div class="history-body-title">프로젝트 등록</div>
								<div class="pull-right history-body-data">0 건</div>
							</div>
							<div class="contract">
								<div class="contract-title">
									<div class="history-body-title">계약한 프로젝트</div>
									<div class="pull-right history-body-data">0 건</div>
								</div>
								<div class="contract-data">
									<div class="contract-data-box">
										<div class="history-body-title">계약률</div>
										<div class="pull-right history-body-data">0%</div>
									</div>
									<div class="contract-data-box">
										<div class="history-body-title">진행중인 프로젝트</div>
										<div class="pull-right history-body-data">0 건</div>
									</div>
									<div class="contract-data-box">
										<div class="history-body-title">완료한 프로젝트</div>
										<div class="pull-right history-body-data">0 건</div>
									</div>
								</div>
							</div>
							<div class="client-history-budget-body">
								<div class="budget-body-title">누적 완료 금액</div>
								<div class="pull-right budget-body-data">
									0 <span class="budget-body-clo">원</span>
								</div>
							</div>
						</div>
					</div>
					<div class="activity">
						<h3 class="activity-heading">새로운 소식</h3>
						<div id="activity-body">
							<ul class="activity-unit-list">
								<li class="empty-activity activity-unit">새로운 소식이 없습니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../footer.jsp" flush="false" />
	
	<script>

$( document ).ready(function($) {
    var p5TotalSubNavigationFlag = 0;


	if ( $( window ).width() >= 1200 ) {
		$( '.p5-side-nav-deactive' ).css( 'display', 'none' );
	} else  {
		$( '.p5-side-nav-active' ).css( 'display', 'none' );
		$( '.p5-side-nav-deactive' ).css( 'display', 'block');
	}

	$('.content-inner').on('click', '.p5-side-nav-active-btn', function () {
		$('.p5-side-nav-active').css( 'display', 'none' );
		$('.p5-side-nav-deactive').css('display','block');
	});

	$('.content-inner').on('click', '.p5-side-nav-deactive-btn', function () {
		$('.p5-side-nav-active').css( 'display', 'block' );
		$('.p5-side-nav-deactive').css('display','none');
	});


    $( window ).scroll ( function () {
		if ( $(window).scrollTop() > 87 && p5TotalSubNavigationFlag === 0) {
			setTimeout(function() {
				$('#p5-total-sub-navigation-wrapper').removeClass('hide fadeOut');
				$('#p5-total-sub-navigation-wrapper').addClass('fadeInDown');
			}, 200 );
			flag = 1;


		} else if ( $(window).scrollTop() <= 87 ){
			p5TotalSubNavigationFlag = 0;
			$('#p5-total-sub-navigation-wrapper').removeClass('fadeInDown');
			$('#p5-total-sub-navigation-wrapper').addClass('fadeOut');
			setTimeout(function() {
				$('#p5-total-sub-navigation-wrapper').addClass('hide');
			}, 200 );
		}
	});
});

</script>
</body>
</html>