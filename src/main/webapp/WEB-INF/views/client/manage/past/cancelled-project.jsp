<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.wjm.models.AccountInfo, com.wjm.models.ProjectInfo, java.util.*, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	List<ProjectInfo> projectlist = (List<ProjectInfo>)request.getAttribute("projectlist");
	int projectCnt = 0;

	Integer completednum = 0;
	if((Integer) request.getAttribute("completednum") != null)
		completednum = (Integer) request.getAttribute("completednum");

	Integer reviewnum = 0;
	if((Integer) request.getAttribute("reviewnum") != null)
		reviewnum = (Integer) request.getAttribute("reviewnum");
	
	if(projectlist != null)
		projectCnt = projectlist.size();
	%>
<html class="no-js modern" lang="ko">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 관리 - 취소한 프로젝트</title>
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
<body class="logged-in client client-management past-management">
	<div id="wrap">
	<jsp:include page="../../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">클라이언트</h3>
						<div class="user-name-tag-body">
							<img alt="<%=account.getId() %> 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/${profile}" />
							<h4 class="username"><%=account.getId() %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a href="/wjm/client/manage/past/review-contract/"><%if(reviewnum.intValue() != 0 ) out.print("<span class='badge badge-info pull-right'>"+reviewnum+"</span> "); %>평가
									대기 중</a></li>
							<li class=""><a
								href="/wjm/client/manage/past/completed-contract/"><%if(completednum.intValue() != 0 ) out.print("<span class='badge badge-info pull-right'>"+completednum+"</span> "); %>완료한 프로젝트</a></li>
							<li class="active"><a
								href="/wjm/client/manage/past/cancelled-project/"><span
									class="badge badge-info pull-right"><%if(projectCnt != 0) out.print(projectCnt); %></span> 취소한 프로젝트</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							취소한 프로젝트 <small class="small-text">진행을 취소한 프로젝트를 확인할 수
								있습니다.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-success.png"
								style="float: left" />
							<p class="process-guide-text" style="float: left">
								1. 검수 또는 지원자 모집 단계에서 <strong>진행을 취소한 프로젝트 목록</strong>입니다.<br />
								2. 모집이 마감된 후 7일 이내에 미팅을 신청하지 않는 경우, <strong>자동으로 프로젝트의
									진행이 취소</strong>됩니다.<br />
							</p>
							<div style="clear: both;"></div>
						</div>
						<section>
						<%
						
							if(projectCnt != 0)
							{
								for(int i=0;i<projectCnt;i++)
								{
								
						%>
						<section class="project-unit">
						<section class="project-unit-heading">
						<h4 class="project-title">
							<%=projectlist.get(i).getName() %>
						</h4>
						</section>
						<section class="project-unit-body">
						<ul class="list-item-narrow">
							<li><h5 class="label-item"
									style="min-width: 80px !important;">
									<i class="fa fa-won"></i> 예상비용
								</h5>
								<span><%=projectlist.get(i).getBudget() %>원</span></li>
							<li><h5 class="label-item"
									style="min-width: 80px !important;">
									<i class="fa fa-clock-o"></i> 예상기간
								</h5>
								<span><%=projectlist.get(i).getPeriod() %>일</span></li>
							<li><h5 class="label-item"
									style="min-width: 80px !important;">
									<i class="fa fa-calendar-o"></i> 취소일자
								</h5>
								<span><%=Time.toString3(projectlist.get(i).getReg_date()) %></span></li>
						</ul>
						</section></section>
						
							<%	
								}
							}
							else
							{
							%>
						<section>
						<p class="text-muted">취소한 프로젝트가 없습니다.</p>
						</section>
							<%
							}
							%>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../../footer.jsp" flush="false" />

</body>
</html>