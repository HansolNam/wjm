<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page
	import="com.wjm.models.AccountInfo, com.wjm.models.ContractInfo, java.util.*, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo) session.getAttribute("account");
	List<ContractInfo> completedlist = (List<ContractInfo>) request.getAttribute("completedlist");
	int completedCnt = 0;

	Integer reviewnum = 0;
	if((Integer) request.getAttribute("reviewnum") != null)
		reviewnum = (Integer) request.getAttribute("reviewnum");

	if (completedlist != null)
		completedCnt = completedlist.size();
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

<title>외주몬(WJM) · 관리 - 완료한 프로젝트</title>
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
<body
	class="logged-in partners partners-management contract-management ">
	<div id="wrap">
	<jsp:include page="../../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="page-inner">
				<div class="sidebar">
					<div class="user-name-tag">
						<h3 class="user-name-tag-heading">파트너스</h3>
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
							<li class=""><a
								href="/wjm/partners/manage/past/review-contract/"><%
										if (reviewnum.intValue() != 0)
											out.print("<span class='badge badge-info pull-right'>" + reviewnum + "</span> ");
									%>평가 대기 중</a></li>
							<li class="active"><a
								href="/wjm/partners/manage/past/completed-contract/"><span
									class="badge badge-info pull-right">
										<%
											out.print(completedCnt);
										%>
								</span>완료한 프로젝트</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							완료한 프로젝트 <small class="small-text">성공적으로 완료한 프로젝트를 확인할 수
								있습니다.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-success.png"
								style="float: left" />
							<p class="process-guide-text" style="float: left">
								1. 현재까지 진행한 <strong>모든 프로젝트 기록을 확인</strong>할 수 있습니다.<br /> 2.
								클라이언트의 평가는 <strong>[프로필 정보 관리 &gt; 프로젝트 히스토리]</strong>에서 볼 수
								있습니다.<br />
							</p>
							<div style="clear: both;"></div>
						</div>
						<section>
						
						<%
						
							if(completedCnt != 0)
							{
								for(int i=0;i<completedCnt;i++)
								{
								
						%>
						<section>
						<div class="p5-partners-project-evaluation">
							<div class="p5-partners-project-evaluation-header">
								<div class="p5-partners-project-evaluation-title">
									<h4>
										<a href="/wjm/project/<%=completedlist.get(i).getName() %>/<%=completedlist.get(i).getProject_pk() %>/"><%=completedlist.get(i).getName() %></a>
									</h4>
								</div>
								<div class="p5-partners-project-evaluation-info">
									<span>클라이언트 <span class="p5-partners-project-info-id"><%=completedlist.get(i).getClient_id()%></span></span>
									<span>카테고리 <span
										class="p5-partners-project-info-category"><%=completedlist.get(i).getProject().getCategoryL()%> &gt;
											<%=completedlist.get(i).getProject().getCategoryM()%></span></span>
								</div>
							</div>
							<div class="p5-partners-project-evaluation-body1">
								<span><i class="fa fa-clock-o"></i>계약일<span
									class="p5-partners-project-evaluation-date"><%=Time.toString3(completedlist.get(i).getReg_date())%></span></span>
								<span><i class="fa fa-won"></i>계약금액<span
									class="p5-partners-project-evaluation-cost"><%=completedlist.get(i).getBudget() %> 원</span></span>
								<span><i class="fa fa-clock-o"></i>계약기간<span
									class="p5-partners-project-evaluation-period"><%=completedlist.get(i).getTerm() %> 일</span></span>
							</div>
							<div class="p5-partners-project-evaluation-body2">
							
							<%
								if(completedlist.get(i).getAssessed() != null)
								{
									double d = (double)(completedlist.get(i).getAssessed().getProfessionalism()+completedlist.get(i).getAssessed().getSatisfaction()
											+completedlist.get(i).getAssessed().getCommunication()+completedlist.get(i).getAssessed().getSchedule_observance()+completedlist.get(i).getAssessed().getActiveness());
									
									d = (double)d/5.0;
							%>
								<h5>평균별점</h5>
								<div class="star-lg star-lg-4"></div>
								<span class="p5-partners-project-rating"><%=Math.round(d*10)/10.0 %></span> 
							</div>
							<div class="p5-review-specific-info">
								<div class="p5-review-group1">
									<span class="p5-review-title">전문성</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-3"></div></span> <span><%=completedlist.get(i).getAssessed().getProfessionalism() %></span></span> <span
										class="p5-review-title">만족도</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-3"></div></span> <span><%=completedlist.get(i).getAssessed().getSatisfaction()%></span></span> <span
										class="p5-review-title">의사소통</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-4"></div></span> <span><%=completedlist.get(i).getAssessed().getCommunication()%></span></span>
								</div>
								<div class="p5-review-group2">
									<span class="p5-review-title">일정 준수</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-5"></div></span> <span><%=completedlist.get(i).getAssessed().getSchedule_observance()%></span></span> <span
										class="p5-review-title">적극성</span> <span
										class="p5-review-star"><span><div
												class="rating star-lg star-lg-5"></div></span> <span><%=completedlist.get(i).getAssessed().getActiveness()%></span></span>
								</div>
								<div class="p5-user-comment">
									<span class="p5-user-img-box"><h6>추천 한마디</h6>
										<img alt="<%=completedlist.get(i).getClient().getId() %> 사진" class="p5-user-comment-img"
										src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=completedlist.get(i).getAssessed().getProfile() %>"></span>
									<span class="p5-user-comment-box"><div>
											<span class="label label-default label-role"><%=completedlist.get(i).getClient().getId() %></span>
										</div>
										<div class="p5-review-comment"><%=completedlist.get(i).getAssessed().getRecommendation().replaceAll("\r\n","<br/>") %></div></span>
								</div>
							</div>
							
							<%
								}
								else
								{
									%>
									
								<h5>아직 상대방이 평가를 하지 않았습니다.</h5>
							</div>
									<%
								}
							%>
						</div>
						</section>
						
							<%	
								}
							}
							else
							{
							%>
						<section>
						<p class="text-muted">완료한 프로젝트가 없습니다.</p>
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
	<script type="text/javascript">
        var TRS_AIDX = 9287;
        var TRS_PROTOCOL = document.location.protocol;
        document.writeln();
        var TRS_URL = TRS_PROTOCOL + '//' + ((TRS_PROTOCOL=='https:')?'analysis.adinsight.co.kr':'adlog.adinsight.co.kr') +  '/emnet/trs_esc.js';
        document.writeln("<scr"+"ipt language='javascript' src='" + TRS_URL + "'></scr"+"ipt>");
        </script>
	<script type="text/javascript">
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-31427125-2', 'wishket.com');
        var ga_now = new Date();
        var dimension4Value = "Y" + ga_now.getFullYear()
                              + "M" + (ga_now.getMonth()+1)
                              + "D" + (ga_now.getDate())
                              + "H" + (ga_now.getHours())
                              + "I" + (ga_now.getMinutes())
                              + "W" + (ga_now.getDay());
        ga('require', 'displayfeatures');
        ga('set', '&uid', '28338');
        ga('send', 'pageview', {
          'dimension1': 'user',
          'dimension2': 'partners',
          'dimension3': '28338',
          'dimension4': dimension4Value
        });
      </script>
	<script type="text/javascript">(function(e,b){if(!b.__SV){var a,f,i,g;window.mixpanel=b;a=e.createElement("script");a.type="text/javascript";a.async=!0;a.src=("https:"===e.location.protocol?"https:":"http:")+'//cdn.mxpnl.com/libs/mixpanel-2.2.min.js';f=e.getElementsByTagName("script")[0];f.parentNode.insertBefore(a,f);b._i=[];b.init=function(a,e,d){function f(b,h){var a=h.split(".");2==a.length&&(b=b[a[0]],h=a[1]);b[h]=function(){b.push([h].concat(Array.prototype.slice.call(arguments,0)))}}var c=b;"undefined"!==
typeof d?c=b[d]=[]:d="mixpanel";c.people=c.people||[];c.toString=function(b){var a="mixpanel";"mixpanel"!==d&&(a+="."+d);b||(a+=" (stub)");return a};c.people.toString=function(){return c.toString(1)+".people (stub)"};i="disable track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config people.set people.set_once people.increment people.append people.track_charge people.clear_charges people.delete_user".split(" ");for(g=0;g<i.length;g++)f(c,i[g]);
b._i.push([a,e,d])};b.__SV=1.2}})(document,window.mixpanel||[]);
mixpanel.init("c7b742deb9d00b4f1c0e1e9e8c5c3115");</script>
	<script type="text/javascript"> if (!wcs_add) var wcs_add={}; wcs_add["wa"] = "s_3225afd5bb50";if (!_nasa) var _nasa={};wcs.inflow();wcs_do(_nasa);</script>
</body>
</html>