<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.wjm.models.AccountInfo, com.wjm.models.AccountInformationInfo"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	String introduction = (String)request.getAttribute("introduction");
	introduction = introduction.replaceAll("\r\n","<br/>");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--[if IE 6]><html lang="ko" class="no-js old ie6"><![endif]-->
<!--[if IE 7]><html lang="ko" class="no-js old ie7"><![endif]-->
<!--[if IE 8]><html lang="ko" class="no-js old ie8"><![endif]-->
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 파트너스 정보 설정</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css" rel="stylesheet"
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
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/resources/static/css/floating.css" rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<style type="text/css">
div.ui-tooltip {
	max-width: 252px !important;
}
</style>
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
<body class="logged-in partners partners-setting">
	<div id="wrap">
		<jsp:include page="../../../header2.jsp" flush="false" />
		<div class="page">
			<div class="container">
				<div id="messages">
					<div class="alert alert-safe alert-warning fade in">
						프로젝트 지원을 위해 <a class="alert-link"
							href="/wjm/partners/p/<%=account.getId() %>/info/update/">'파트너스 정보'</a>, <a
							class="alert-link"
							href="/wjm/partners/p/<%=account.getId() %>/introduction/update/">'자기 소개'</a>,
						<a class="alert-link"
							href="/wjm/partners/p/<%=account.getId() %>/skill/update/">'보유 기술'</a>, <a
							class="alert-link"
							href="/wjm/partners/p/<%=account.getId() %>/portfolio/update/">'포트폴리오'</a>을(를)
						입력해주세요.
					</div>
				</div>
			</div>
			<div class="page">
				<div class="container">
					<div class="p5-back-content">
						<p class="p5-back-nav">
							<a class="p5-back-nav-link"
								href="/wjm/partners/p/<%=account.getId() %>/info/update/">[ 프로필 정보 관리 ]</a> <i
								class="p5-back-nav-arrow fa fa-caret-right"></i> [ 자기 소개 ]
						</p>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="sidebar">
					<div class="sidebar-nav">
						<ul>
							<li class=""><a href="/wjm/partners/p/<%=account.getId() %>/info/update/">파트너스
									정보</a></li>
							<li class="active"><a
								href="/wjm/partners/p/<%=account.getId() %>/introduction/update/">자기 소개</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=account.getId() %>/portfolio/update/">포트폴리오</a></li>
							<li class=""><a href="/wjm/partners/p/<%=account.getId() %>/skill/update/">보유
									기술</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=account.getId() %>/background/update/">경력, 학력,
									자격증</a></li>
							<li class=""><a
								href="/wjm/partners/p/<%=account.getId() %>/evaluation/update/">프로젝트 히스토리</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-inner" style="padding-top: 15px;">
						<section class="p5-partition-title">
						<h3 class="header-text" style="margin-bottom: 30px">
							자기 소개 <span class="pull-right">
							
							<a class="btn btn-primary"
								href="/wjm/partners/p/<%=account.getId() %>"
								style="margin-top: -7px;">내 프로필에서 보기</a>
								</span>
						</h3>
						</section>
						<section class="p5-last-section p5-introduction-body">
						<p id="p5-partners-self-introduction"></p>
						
								<% 
									if(introduction!= null)
									{
										
								%>
								<div class="p5-description-hasvalue"
									style="text-overflow: ellipsis; overflow: hidden; word-wrap: break-word; margin-bottom: 30px;">
									<%=introduction%>
								</div>
								<%
									}
									else
									{
								%>
								<div class="p5-empty-component-md">
									<div class="p5-assign-component">
										<div>
											<div>
													입력된 <span class="text-center p5-bold">'자기소개'</span>가 없습니다.
												</p>
											</div>
										</div>
									</div>
								</div>
								<%
									}
								%>
						<p></p>
						<div class="btn-wrapper pull-right">
							<a class="btn btn-default btn-submit" href="/wjm/partners/p/<%=account.getId() %>/introduction/update/add"
								id="p5-modify-self-introduction"
								style="margin-bottom: -110px !important;">입력</a>
						</div>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	
	<jsp:include page="../../../footer.jsp" flush="false" />
	<script type="text/javascript">
  $(function() {
    wishket.init();
    
    svgeezy.init(false, 'png');
  });
</script>
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