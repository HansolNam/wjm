<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.wjm.main.function.Validator, com.wjm.models.AccountInformationInfo,com.wjm.models.AccountInfo,com.wjm.models.ProjectInfo, com.wjm.main.function.Time, java.sql.Timestamp"%>
<%
	ProjectInfo project = (ProjectInfo) request.getAttribute("project");
	AccountInformationInfo this_accountinfo = (AccountInformationInfo) request.getAttribute("this_accountinfo");
	AccountInfo this_account = (AccountInfo) request.getAttribute("this_account");

	String description = "";
	description = project.getDescription().replaceAll("\r\n", "<br/>");

	long now_time = System.currentTimeMillis();
	Timestamp now = new Timestamp(now_time);
	
	String filename = project.getFilename();
%>

<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 프로젝트 - <%=project.getName() %></title>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/CACHE/css/7911bc0a5c62.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/static/CACHE/css/aa41eeaffc60.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/static/CACHE/css/35066c295d92.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/cc2b8202dedf.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/CACHE/css/0873b963b20a.css" type="text/css" /><![endif]-->
<link
	href="${pageContext.request.contextPath}/resources/static/django_facebook/css/facebook.css"
	media="all" rel="stylesheet" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/a52a868564de.js"
	type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/css/floating.css"
	rel="stylesheet" />
<script src="http://wcs.naver.net/wcslog.js" type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/resources/static/favicon.ico"
	rel="shortcut icon" type="image/x-icon" />
<link
	href="${pageContext.request.contextPath}/resources/static/favicon.ico"
	rel="icon" type="image/x-icon" />
<link
	href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad.png"
	rel="apple-touch-icon" sizes="76x76" />
<link
	href="${pageContext.request.contextPath}/resources/static/touch-icon-iphone-retina.png"
	rel="apple-touch-icon" sizes="120x120" />
<link
	href="${pageContext.request.contextPath}/resources/static/touch-icon-ipad-retina.png"
	rel="apple-touch-icon" sizes="152x152" />
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/cb793deb7347.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/CACHE/js/c3617c8217d0.js"
	type="text/javascript"></script>
</head>
<body class="logged-in client project-preview">
	<div id="wrap">
		<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages">
			</div>
		</div>
		<div class="page">
			<div class="content">
				<p class="back">
				<a href='/wjm/admin/home/'>[관리자 홈]으로 가기 <i class='fa fa-arrow-circle-o-right'></i></a>
					
				</p>
				<div class="content-inner">
					<div class="header-text project-detail-header"><%=project.getName()%>
					</div>
					<div class="project-detail-category"><%=project.getCategoryL()%>
						&gt;
						<%=project.getCategoryM()%></div>
					<div class="summary">
						<div class="project-detail-basic-info">
							<div class="budget">
								<i class="fa fa-krw"></i> <span class="title">예상금액</span>
								<%=project.getBudget()%>원
							</div>
							<div class="term">
								<i class="fa fa-clock-o"></i> <span class="title">예상기간</span>
								<%=project.getPeriod()%>일
							</div>
							<div class="deadline">
								<i class="fa fa-pencil"></i> <span class="title">모집마감</span>
								<%=Time.toString3(project.getDeadline())%>
							</div>
						</div>
						<div class="project-detail-meta-info">
							<div class="project-data-box">
								<div class="title one">기획 상태</div>
								<div class="data d-one">
									<%
										if (project.getPlan_status().equals("idea"))
											out.print("아이디어");
										else if (project.getPlan_status().equals("simple"))
											out.print("간단한 정리");
										else if (project.getPlan_status().equals("project_book"))
											out.print("상세한 기획 문서");
									%>
								</div>
								<div class="title two">매니징 경험</div>
								<div class="data d-two">
									<%
										if (project.getManaging() == 1)
											out.print("있음");
										else
											out.print("없음");
									%>
								</div>
								<div class="title three">등록 일자</div>
								<div class="data d-three"><%=Time.toString3(project.getReg_date())%></div>
							</div>
							<div class="project-data-box bottom-box">
								<div class="title one">예상 시작일</div>
								<div class="data d-one"><%=Time.toString3(project.getStart_date())%></div>
								<div class="title two">미팅 방식</div>
								<div class="data d-two">
									<%
										if (project.getMeeting_type().equals("ONLINE"))
											out.print("온라인 미팅");
										else
											out.print("오프라인 미팅");
									%>
								</div>
								<div class="title three">진행 지역</div>
								<div class="data d-three"><%=project.getMeeting_area()%>
									&gt;
									<%=project.getMeeting_area_detail()%></div>
							</div>
						</div>
						<div class="project-desc">
							<div class="project-desc-title">프로젝트 내용</div>
							<%=description%>
						</div>
						<div class="project-desc">
							<div class="project-desc-title">프로젝트 첨부파일</div>
							<%
								if(!Validator.hasValue(filename))
								{
							%>
							파일이 존재하지 않습니다.
							<%
								}
								else
								{
							%>
							
							<a href="/wjm/Filedownload?filename=<%=java.net.URLEncoder.encode(project.getFilename())%>"><%=project.getFilename()%></a>
							<%
								}
							%>
						</div>
						<div class="project-skill-required">
							<div class="skill-required-title">관련 기술</div>
							<%
								String[] skill = project.getTechnique().split(",");
								for (int i = 0; i < skill.length; i++) {
									out.println("<span class='project-skill label-skill'>" + skill[i] + "</span>");
								}
							%>
						</div>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<div class="inner">
					<div class="project-action-btn-group">
						<a
							class="btn btn-large btn-partners btn-project-application btn-block" id="id_success"
							href="/wjm/admin/project/<%=project.getName()%>/<%=project.getPk()%>/exam/success/">프로젝트 검수 완료하기</a>
						<hr>
						<a
							class="btn btn-large btn-project-application btn-default btn-block"  id="id_fail"
							href="/wjm/admin/project/<%=project.getName()%>/<%=project.getPk()%>/exam/fail/" style="margin-bottom: 0;"><span
							id="interest_action_text">프로젝트 등록 거부하기</span></a>
						<hr>
						<a
							class="btn btn-large btn-project-application btn-default btn-block"
							href="/wjm/admin/project/edit/<%=project.getPk()%>/" style="margin-bottom: 0;"><span
							id="interest_action_text">프로젝트 수정하기</span></a>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />

	<script type="text/javascript">

	$(document).ready(function(){

		$( "#id_success" ).click(function() {

			if(confirm("프로젝트를 검수완료하시겠습니까?") == false)
				return false;
			
			return true;
		
			});

		$( "#id_fail" ).click(function() {

			if(confirm("프로젝트를 등록 거부하시겠습니까?") == false)
				return false;
			
			return true;
		
			});
		});
	</script>
</body>
</html>