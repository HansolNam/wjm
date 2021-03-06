<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.wjm.models.AssessmentInfo, java.util.List, com.wjm.main.function.Validator, com.wjm.models.AccountInformationInfo,com.wjm.models.AccountInfo,com.wjm.models.ProjectInfo, com.wjm.main.function.Time, java.sql.Timestamp"%>
<%
	ProjectInfo project = (ProjectInfo)request.getAttribute("project");
	AccountInformationInfo this_accountinfo = (AccountInformationInfo)request.getAttribute("this_accountinfo");
	AccountInfo this_account = (AccountInfo)request.getAttribute("this_account");

	String profile = (String)request.getAttribute("profile");
	String description = "";
	description = project.getDescription().replaceAll("\r\n","<br/>");

	String introduction = "";
	if(this_accountinfo != null)
	{
		if(Validator.hasValue(this_accountinfo.getIntroduction()))
			introduction = this_accountinfo.getIntroduction().replaceAll("\r\n","<br/>");
	}
	long now_time = System.currentTimeMillis();
	Timestamp now = new Timestamp(now_time);
	
	List<ProjectInfo> projectlist = (List<ProjectInfo>)request.getAttribute("projectlist");
	int check_cnt = 0;
	int recruit_cnt = 0;
	int ing_cnt = 0;
	int finish_cnt = 0;
	
	if(projectlist != null)
	{
		for(int i=0;i<projectlist.size();i++)
		{
			if(projectlist.get(i).getStatus().equals("검수중"))
			{
				check_cnt++;
			}
			else if(projectlist.get(i).getStatus().equals("지원자모집중"))
			{
				recruit_cnt++;
			}
			else if(projectlist.get(i).getStatus().equals("진행중"))
			{
				ing_cnt++;
			}
			else if(projectlist.get(i).getStatus().equals("완료한프로젝트"))
			{
				finish_cnt++;
			}
		}
	}
	
	//총 누적금액
	Integer total_budget = (Integer)request.getAttribute("total");
	if(total_budget == null) total_budget = 0;

	//평가받은 리스트
	List<AssessmentInfo> assessmentlist = (List<AssessmentInfo>)request.getAttribute("assessmentlist");
	int assessmentnum;
	int total = 0, professionalism = 0, satisfaction = 0, communication = 0, schedule_observance = 0,activeness = 0;
	double total_avg = 0.0;
	if(assessmentlist == null) assessmentnum = 0;
	else
	{
		assessmentnum = assessmentlist.size();
		
		for (int i = 0; i < assessmentnum; i++) {
			int avg = (assessmentlist.get(i).getProfessionalism() + assessmentlist.get(i).getSatisfaction()
					+ assessmentlist.get(i).getCommunication() + assessmentlist.get(i).getSchedule_observance()
					+ assessmentlist.get(i).getActiveness()) / 5;
			
			professionalism += assessmentlist.get(i).getProfessionalism();
			satisfaction += assessmentlist.get(i).getSatisfaction();
			communication += assessmentlist.get(i).getCommunication();
			schedule_observance += assessmentlist.get(i).getSchedule_observance();
			activeness += assessmentlist.get(i).getActiveness();
		}
			
		if (assessmentnum != 0) {
				total = professionalism + satisfaction + communication + schedule_observance + activeness;
				total_avg = (double) total / (double) (assessmentnum * 5);
				professionalism /= assessmentnum;
				satisfaction /= assessmentnum;
				communication /= assessmentnum;
				schedule_observance /= assessmentnum;
				activeness /= assessmentnum;
			}
	}
	
	String filename = project.getFilename();
%>

<!DOCTYPE html>
<html class="no-js modern" lang="ko">
<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 프로젝트 - <%=project.getName() %></title>
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
<body class="logged-in client project-preview">
	<div id="wrap">
	<jsp:include page="../header.jsp" flush="false" />
		<div class="container">
			<div id="messages">
				<div class="alert alert-safe alert-preview alert-warning fade in">
					<p>
						<i class="fa fa-exclamation-circle icon-highlight"></i> <strong
							class="text-highlight"><%=project.getStatus() %>인 프로젝트</strong> 화면입니다.
					</p>
				</div>
			</div>
		</div>
		<div class="page">
			<div class="content">
				<p class="back">
				<%
					if(project.getStatus().equals("임시저장"))
					{
						out.println("<a href='/wjm/client/manage/project/saved/'>["+project.getStatus()+"]으로 가기 <i"
								+" class='fa fa-arrow-circle-o-right'></i></a>");
					}
					else if(project.getStatus().equals("검수중"))
					{
						out.println("<a href='/wjm/client/manage/project/submitted/'>["+project.getStatus()+"]으로 가기 <i"
								+" class='fa fa-arrow-circle-o-right'></i></a>");
					}
					else if(project.getStatus().equals("등록실패"))
					{
						out.println("<a href='/wjm/client/manage/project/rejected/'>["+project.getStatus()+"]으로 가기 <i"
								+" class='fa fa-arrow-circle-o-right'></i></a>");
					}
					else if(project.getStatus().equals("지원자모집중"))
					{
						out.println("<a href='/wjm/client/manage/recruiting/'>["+project.getStatus()+"]으로 가기 <i"
								+" class='fa fa-arrow-circle-o-right'></i></a>");
					}
					else if(project.getStatus().equals("진행중"))
					{
						out.println("<a href='/wjm/client/manage/contract-in-progress/'>["+project.getStatus()+"]으로 가기 <i"
								+" class='fa fa-arrow-circle-o-right'></i></a>");
					}
					else if(project.getStatus().equals("평가대기중"))
					{
						out.println("<a href='/wjm/client/manage/past/review-contract/'>["+project.getStatus()+"]으로 가기 <i"
								+" class='fa fa-arrow-circle-o-right'></i></a>");
					}
					else if(project.getStatus().equals("완료한프로젝트"))
					{
						out.println("<a href='/wjm/client/manage/past/completed-contract/'>["+project.getStatus()+"]으로 가기 <i"
								+" class='fa fa-arrow-circle-o-right'></i></a>");
					}
					else if(project.getStatus().equals("취소한프로젝트"))
					{
						out.println("<a href='/wjm/client/manage/past/cancelled-project/'>["+project.getStatus()+"]으로 가기 <i"
								+" class='fa fa-arrow-circle-o-right'></i></a>");
					}
					
				%>
				</p>
				<div class="content-inner">
					<div class="header-text project-detail-header"><%=project.getName() %>
					<span class="label label-sm label-reviewing"><%=project.getStatus() %></span> <span
							class="applicant-count">총 <span class="applicant-num"><%=project.getApplicantnum() %>명</span>
							지원
						</span>
					</div>
					<div class="project-detail-category"><%=project.getCategoryL() %> &gt; <%=project.getCategoryM() %></div>
					<div class="summary">
						<div class="project-detail-basic-info">
							<div class="budget">
								<i class="fa fa-krw"></i> <span class="title">예상금액</span> <%=project.getBudget()%>원
							</div>
							<div class="term">
								<i class="fa fa-clock-o"></i> <span class="title">예상기간</span>
								<%=project.getPeriod() %>일
							</div>
							<div class="deadline">
								<i class="fa fa-pencil"></i> <span class="title">모집마감</span>
								<%=Time.toString3(project.getDeadline()) %>
							</div>
						</div>
						<div class="project-detail-meta-info">
							<div class="project-data-box">
								<div class="title one">기획 상태</div>
								<div class="data d-one">
									<%
										if(project.getPlan_status().equals("idea"))
											out.print("아이디어");
										else if(project.getPlan_status().equals("simple"))
											out.print("간단한 정리");
										else if(project.getPlan_status().equals("project_book"))
											out.print("상세한 기획 문서");
									%>
								</div>
								<div class="title two">매니징 경험</div>
								<div class="data d-two">
									<%
										if(project.getManaging() == 1)
											out.print("있음");
										else
											out.print("없음");
									%>
								</div>
								<div class="title three">등록 일자</div>
								<div class="data d-three"><%=Time.toString3(project.getReg_date()) %></div>
							</div>
							<div class="project-data-box bottom-box">
								<div class="title one">예상 시작일</div>
								<div class="data d-one"><%=Time.toString3(project.getStart_date()) %></div>
								<div class="title two">미팅 방식</div>
								<div class="data d-two">
								<%
										if(project.getMeeting_type().equals("ONLINE"))
											out.print("온라인 미팅");
										else
											out.print("오프라인 미팅");
									%>
								</div>
								<div class="title three">진행 지역</div>
								<div class="data d-three"><%=project.getMeeting_area() %> &gt; <%=project.getMeeting_area_detail() %></div>
							</div>
						</div>
						<div class="project-desc">
							<div class="project-desc-title">프로젝트 내용</div>
								<%=description %>
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
								for(int i=0;i<skill.length;i++)
								{
									out.println("<span class='project-skill label-skill'>"+skill[i]+"</span>");
								}
							%>
						</div>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<div class="inner">
					<%
						int register_num = check_cnt+recruit_cnt+ing_cnt+finish_cnt;
						int contract_num = ing_cnt+finish_cnt;
						
						double contract_per = 0;
						if(register_num != 0)
						{
							contract_per = 100.0*(double)contract_num/(double)register_num;
						}
						
						if(assessmentnum != 0)
						{
						total_avg = (double) total / (double) (assessmentnum * 5);
						professionalism /= assessmentnum;
						satisfaction /= assessmentnum;
						communication /= assessmentnum;
						schedule_observance /= assessmentnum;
						activeness /= assessmentnum;
						}
					%>
					<div class="client-info-box">
						<h3 class="client-name-tag-heading">클라이언트</h3>
						<div class="client-name-tag-body">
							<img alt="<%=this_account.getId() %> 사진" class="client-img-lg"
								src="${pageContext.request.contextPath}/resources/upload/profile_img/<%=profile%>" />
							<div class="client-company-info"><%=introduction %></div>
							<div class="client-evaluation-body"
								onclick="expand_rating(this);">
								<div class="rating star-md star-md-0"></div>
								<div class="rating-body">
									<span class="averageScore"><%=Math.round(total_avg * 10) / 10.0%></span> <span
										class="averageScore-body">/ 평가 <%=assessmentnum %>개</span>
									<div class="rating-expand-arrow">
										<span class="fa fa-sort-asc" id="rating-arrow"></span>
									</div>
								</div>
							</div>
							<div class="expanded-rating" id="expanded-rating"
								style="display: none">
								<div class="rating-row">
									<span class="expanded-rating-title">전문성</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score"><%=professionalism %></span>
								</div>
								<div class="rating-row">
									<span class="expanded-rating-title">일정 준수</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score"><%=schedule_observance %></span>
								</div>
								<div class="rating-row">
									<span class="expanded-rating-title">사전 준비</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score"><%=satisfaction %></span>
								</div>
								<div class="rating-row">
									<span class="expanded-rating-title">적극성</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score"><%=activeness %></span>
								</div>
								<div class="rating-row">
									<span class="expanded-rating-title">의사소통</span>
									<div class="rating star-sm star-sm-0"></div>
									<span class="expanded-rating-score"><%=communication %></span>
								</div>
							</div>
							<div class="client-history-body">
								<div class="project">
									<div class="history-body-title">프로젝트 등록</div>
									<div class="pull-right history-body-data"><%=register_num %> 건</div>
								</div>
								<div class="contract">
									<div class="contract-title">
										<div class="history-body-title">계약한 프로젝트</div>
										<div class="pull-right history-body-data"><%=contract_num %> 건</div>
									</div>
									<div class="contract-data">
										<div class="contract-data-box">
											<div class="history-body-title">계약률</div>
											<div class="pull-right history-body-data"><%=Math.round(contract_per*10.0)/10.0%>%</div>
										</div>
										<div class="contract-data-box">
											<div class="history-body-title">진행중인 프로젝트</div>
											<div class="pull-right history-body-data"><%=ing_cnt %> 건</div>
										</div>
										<div class="contract-data-box">
											<div class="history-body-title">완료한 프로젝트</div>
											<div class="pull-right history-body-data"><%=finish_cnt %> 건</div>
										</div>
									</div>
								</div>
							</div>
							<div class="client-history-budget-body">
								<div class="budget-body-title">누적 완료 금액</div>
								<div class="pull-right budget-body-data">
									<%=total_budget %> <span class="budget-body-clo">원</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../footer.jsp" flush="false" />
<script>
		function expand_rating(obj) {
			var $obj = $(obj);
			if ($obj.attr('class') == 'client-expanded-evaluation-body') {
				$('#expanded-rating').css('display', 'none');
				$obj.attr('class', 'client-evaluation-body');
				$('#rating-arrow').prop('class', 'fa fa-sort-asc');
			} else {
				$('#expanded-rating').css('display', 'block');
				$obj.attr('class', 'client-expanded-evaluation-body');
				$('#rating-arrow').prop('class', 'fa fa-sort-desc');
			}
		}
		</script>
</body>
</html>