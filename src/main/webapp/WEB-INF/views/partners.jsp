<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page
	import="com.wjm.models.AccountInfo, java.util.List"%>
<%
	List<AccountInfo> partnerslist = (List<AccountInfo>) request.getAttribute("partnerslist");
	Integer partnersnum = (Integer) request.getAttribute("partnersnum");
	if(partnersnum == null) partnersnum = 0;
%>
<!--[if IE 6]><html lang="ko" class="no-js old ie6"><![endif]-->
<!--[if IE 7]><html lang="ko" class="no-js old ie7"><![endif]-->
<!--[if IE 8]><html lang="ko" class="no-js old ie8"><![endif]-->
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 파트너스 목록</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link href="../resources/static/CACHE/css/7911bc0a5c62.css"
	rel="stylesheet" type="text/css" />
<link href="../resources/static/CACHE/css/aa41eeaffc60.css"
	rel="stylesheet" type="text/css" />
<link href="../resources/static/CACHE/css/35066c295d92.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link href="/resources/static/django_facebook/css/facebook.css"
	media="all" rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="../resources/static/CACHE/js/a52a868564de.js"
	type="text/javascript"></script>
<link href="../resources/static/css/floating.css" rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link href="../resources/static/favicon.ico" rel="shortcut icon"
	type="image/x-icon" />
<link href="../resources/static/favicon.ico" rel="icon"
	type="image/x-icon" />
<link href="../resources/static/touch-icon-ipad.png"
	rel="apple-touch-icon" sizes="76x76" />
<link href="../static/touch-icon-iphone-retina.png"
	rel="apple-touch-icon" sizes="120x120" />
<link href="../static/touch-icon-ipad-retina.png" rel="apple-touch-icon"
	sizes="152x152" />
<script src="../resources/static/CACHE/js/cb793deb7347.js"
	type="text/javascript"></script>
<script src="../resources/static/CACHE/js/c3617c8217d0.js"
	type="text/javascript"></script>
</head>
<body class=" partners-list">
	<div id="wrap">
		<jsp:include page="header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						파트너스 목록 <small class="small-text"><%=partnersnum %>명의 파트너스가 있습니다.</small>
					</h3>
					<section class="search search-right">
						<form action="." class="form-inline" method="get" role="form">
							<div class="form-group">
								<label class="sr-only" for="#partners-category">분야</label><select
									class="form-control" id="id_job" name="job"><option
										selected="selected" value="">직종</option>
									<option value="">모두</option>
									<option value="개발자">개발자</option>
									<option value="디자이너">디자이너</option></select>
							</div>
							<div class="form-group">
								<input class="input-query form-control" id="id_q"
									maxlength="100" name="q" type="text" />
							</div>
							<div class="form-group">
								<input class="btn btn-default form-control" type="submit"
									value="검색하기" />
							</div>
						</form>
					</section>
				</div>
				<div class="content-inner">
				<%
				
				for(int i=0;i<partnersnum;i++)
				{
					String profile_img = partnerslist.get(i).getAccountinfo().getProfile_img();
					if(profile_img == null) profile_img = "default_avatar.png";
				%>
					<section class="partners-unit">
						<a class="grid-block" href="/wjm/partners/p/<%=partnerslist.get(i).getId() %>/"></a>
						<section class="partners-basic-info">
							<div class="partners-object">
								<img alt="파트너스 프로필 이미지" class="partners-profile-image"
									src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=profile_img %>" />
							</div>
							<section class="partners-basic-info-body">
								<div class="partners-unit-heading">
									<h4 class="partners-username"><%=partnerslist.get(i).getId() %></h4>
									<span
										class="label label-sm label-partners-availability possible"><%=partnerslist.get(i).getPartnersinfo().getAvailability() %></span>
								</div>
								<section class="partners-business-info">
									<span class="job"><%=partnerslist.get(i).getPartnersinfo().getJob() %></span> <span
										class="form-of-business"><%=partnerslist.get(i).getAccountinfo().getForm() %></span>
								</section>
								<section class="partners-desc">
									<p><%=partnerslist.get(i).getAccountinfo().getIntroduction() %></p>
									<!-- <p>국내 외 다양항 프로잭트를 성공적으로 수행 해 온 저희는 새로움을 모색하여 도약의 발판을 마련하고자
										하는 기업에게 있어서 가장 적절한 전략적 파트너 입니다. 우리는 폭넓은 전문성을 바탕으로 고객의 당면한 문제를
										정확하게 파악할 수 있으며, ...</p> -->
								</section>
								<section class="partners-skill-list">
									
									<%
										if(partnerslist.get(i).getTechniqueinfo() != null)
										{
											for(int j=0;j<partnerslist.get(i).getTechniqueinfo().size();j++)
											{
									%>
									<span class="partners-skill label-skill"><%=partnerslist.get(i).getTechniqueinfo().get(j).getName() %></span>
									<%
											}
										}
									%>
								
								</section>
							</section>
						</section>
						<section class="partners-additional-info">
							<div class="partners-stats">
								<ul class="list-unstyled">
									<li><div class="rating star-lg star-lg-5"></div> <span
										class="rating-stats-body stats-body"><span
											class="average-rating-score">5.0</span> <span
											class="rating-append-unit append-unit">/ 평가 개</span></span></li>
									<li><span class="label-stats">계약한 프로젝트</span> <span
										class="stats-body"><%=partnerslist.get(i).getContractnum() %> <span class="append-unit">건</span></span></li>
									<li><span class="label-stats">포트폴리오</span> <span
										class="stats-body"><%=partnerslist.get(i).getPortfolionum()%> <span class="append-unit">개</span></span></li>
								</ul>
							</div>
							<div class="partners-authentication">
								<span class="partners-authorized"><i
									class="fa fa-check-circle-o"></i> 신원 인증</span> <span
									class="partners-authorized"><i
									class="fa fa-check-circle-o"></i> 연락처 등록</span>
							</div>
						</section>
					</section>
					
				
				<%
				}
				%>
					<div class="pagination-wrapper" style="clear: both">
						<ul class="pagination">
							<li class="active"><span class="current">1</span></li>
							<li><a href="?page=2">2</a></li>
							<li><a href="?page=3">3</a></li>
							<li><a href="?page=4">4</a></li>
							<li><a href="?page=5">5</a></li>
							<li><a href="?page=6">6</a></li>
							<li><a href="?page=7">7</a></li>
							<li><a href="?page=8">8</a></li>
							<li><a href="?page=9">9</a></li>
							<li><a href="?page=10">10</a></li>
							<li><a class="next" href="?page=2"><i
									class="fa fa-arrow-right"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="footer.jsp" flush="false" />
</body>
</html>