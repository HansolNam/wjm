<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.models.AccountInfo, com.wjm.models.ProjectInfo, java.util.*, com.wjm.main.function.Time"%>
<%
	AccountInfo account = (AccountInfo)session.getAttribute("account");
	List<ProjectInfo> projectlist = (List<ProjectInfo>)request.getAttribute("projectlist");
	int projectCnt = 0;
	
	Integer submittednum = (Integer)request.getAttribute("submittednum");
	Integer rejectednum = (Integer)request.getAttribute("rejectednum");
	
	if(submittednum == null)
		submittednum = 0;
	if(rejectednum == null)
		rejectednum = 0;
	
	if(projectlist != null)
		projectCnt = projectlist.size();
	%>
<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>외주몬(WJM) · 관리 - 임시 저장</title>
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
<body class="logged-in client client-management project-management">
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
							<img alt="gksthf1611 사진" class="img-circle user-img"
								src="${pageContext.request.contextPath}/resources/static/img/default_avatar.png" />
							<h4 class="username"><%=account.getId() %></h4>
							<a class="profile-setting" href="/wjm/accounts/settings/profile/">기본
								정보 수정</a>
						</div>
					</div>
					<div class="sidebar-nav">
						<ul>
							<li class=""><a href="/wjm/client/manage/project/submitted/"><%if(submittednum != null && submittednum.intValue() != 0 ) out.print("<span class='badge badge-info pull-right'>"+submittednum+"</span> "); %>검수
									중</a></li>
							<li class="active"><a href="/wjm/client/manage/project/saved/"><span
									class="badge badge-info pull-right"><%=projectCnt %></span> 임시 저장</a></li>
							<li class=""><a href="/wjm/client/manage/project/rejected/"><%if(rejectednum != null && rejectednum.intValue() != 0 ) out.print("<span class='badge badge-info pull-right'>"+rejectednum+"</span> "); %>등록
									실패</a></li>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="content-header action">
						<h3 class="header-text">
							임시 저장 <small class="small-text">작성 도중 저장한 프로젝트를 확인할 수
								있습니다.</small>
						</h3>
					</div>
					<div class="content-inner">
						<div class="process-guide-box">
							<img src="${pageContext.request.contextPath}/resources/static/img/process-guide-success.png"
								style="float: left" />
							<p class="process-guide-text" style="float: left">
								1. 내용 작성 중에 <strong>임시 저장 된 프로젝트 목록</strong>입니다.<br /> 2. <strong>'수정'
									버튼을 클릭</strong>하여 프로젝트 내용을 변경할 수 있습니다.
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
									<h4 class="project-title"><%=projectlist.get(i).getName() %></h4>
									<div class="management-tools">
										<a class="btn btn-sm btn-default" href="/wjm/project/add/edit/<%=projectlist.get(i).getPk() %>/">수정</a>
										<a class="btn btn-sm btn-cancel project-cancel-btn" data-toggle="modal"
											href="#saved-project-delete-modal" project-title="<%=projectlist.get(i).getName() %>" project-pk="<%=projectlist.get(i).getPk() %>" role="button">삭제</a>
									</div>
								</section>
								<section class="project-unit-body">
									<ul class="project-info list-item-narrow">
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
												<i class="fa fa-calendar-o"></i> 저장일자
											</h5>
											<span><%=Time.toString3(projectlist.get(i).getReg_date()) %></span></li>
									</ul>
								</section>
							</section>
							<%	
								}
							}
							else
							{
							%>
							<section>
								<p class="text-muted">임시 저장인 프로젝트가 없습니다.</p>
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
	<div aria-hidden="true"
		aria-labelledby="saved-project-delete-modal-label"
		class="modal fade" id="saved-project-delete-modal" role="dialog"
		tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header modal-header-delete">
					<button aria-hidden="true" class="close" data-dismiss="modal"
						type="button">×</button>
					<h4 class="modal-title">저장된 프로젝트 삭제</h4>
				</div>
				<div class="modal-body">
					<form action="/wjm/project/delete/" class="form-horizontal"
						enctype="multipart/form-data" id="saved-project-delete-form"
						method="POST">
						<input name="delete_project_id" type="hidden"
							value="" />
						<input name="delete_project_name" type="hidden"
							value="" />
						<p id="p5-haveskill-name">aaaa을(를) 정말 삭제하시겠습니까?</p>
						<div class="form-group">
							<div class="btn-wrapper-right">
								<input class="btn btn-warning btn-submit" type="button" id="project-delete-btn"
									value="예" />
									<a aria-hidden="true" class="btn btn-cancel"
									data-dismiss="modal">아니오</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>

	$( document ).ready(function($) {

	    $('.content-inner').on('click', '.project-cancel-btn', function(event) {
	        event.preventDefault();
	        projectPK = $(this).attr('project-pk');
	        $('[name="delete_project_id"]').val(projectPK);
	        $('[name="delete_project_name"]').val($(this).attr('project-title'));

	        $('#p5-haveskill-name').html('"'+$(this).attr('project-title')+'"'+'을(를) 정말 삭제하시겠습니까?');
	    });

	    $("#project-delete-btn").click(function(event){
	    	event.preventDefault();

	        $.ajax({
			    type: "POST",
			    url: "/wjm/project/delete",
			    data: $('#saved-project-delete-form').serialize(),  // 폼데이터 직렬화
			    dataType: "json",   // 데이터타입을 JSON형식으로 지정
			    contentType: "application/x-www-form-urlencoded; charset=utf-8",
			    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
			        var messages = data.messages;

			    	if(messages == "success")
			        	{
			    		location.href="/wjm/client/manage/project/saved/"; 
			        	}
			        else if(messages == "error")
			        	{
			        	location.href="/wjm/mywjm/client"; 
			        	}
			        else
			        	{
						$("#messages").html("<div class='alert alert-warning fade in'>"+messages+"</div>");
			        	}
			        
			    },
			    error: function(jqXHR, textStatus, errorThrown) 
			    {
			        //에러코드
			        alert('에러가 발생했습니다.');
			    }
			});
	    });
	});
	
	</script>
</body>
</html>