<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wjm.main.function.Time"%>
<%   
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<!--[if IE 6]><html lang="ko" class="no-js old ie6"><![endif]-->
<!--[if IE 7]><html lang="ko" class="no-js old ie7"><![endif]-->
<!--[if IE 8]><html lang="ko" class="no-js old ie8"><![endif]-->
<html class="no-js modern" lang="ko">

<meta charset="utf-8" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<title>외주몬(WJM) · 프로젝트 생성</title>
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
<body class="logged-in client project-add-detail">
	<div id="wrap">
	<jsp:include page="../../header.jsp" flush="false" />
		<div class="container">
			<div id="messages"></div>
		</div>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						프로젝트 등록 <small class="small-text">상세하게 작성해주실수록 더 적합한 파트너스를
							만날 수 있습니다.</small>
					</h3>
				</div>
				<div class="content-inner">
					<form action="/wjm/project/add/detail/" class="form-horizontal-70" data-behaviours="lock"
						enctype="multipart/form-data" method="POST"
						novalidate="novalidate">
						<input name="csrfmiddlewaretoken" type="hidden"
							value="ea0aZfFjzqhmsqlZpktFMN7yDYNwZToQ" />
						<div class="form-input-rapper">
							<span class="help-block"></span>
							<div class="form-group category-form-group " id="category_div">
								<label class="control-label required" for="category"><span>*</span>카테고리</label>
								<div class="control-wrapper">
									<div class="category-wrapper">
										<select id="category" name="category" required="required"><option
												value="">카테고리</option>
											<option value="develop">개발</option>
											<option value="design">디자인</option></select><select id="sub_category"
											name="sub_category" required="required"><option
												value="">세부 카테고리</option></select>
									</div>
									<span class="help-block">프로젝트 카테고리를 선택해 주세요.</span>
									<span class="help-block">${category_msg}</span>
								</div>
							</div>
							<div class="form-group form-siblings" id="is_turnkey_div">
								<label class="control-label required" for="is_turnkey"><span></span></label>
								<div class="control-wrapper">
									<div class="turnkey-checker turnkey-none" id="turnkey-box">
										<span class="turnkey-none" id="turnkey-dev"><img
											src="${pageContext.request.contextPath}/resources/static/img/exclamation-circle.png" /><strong>디자인</strong>도
											함께 필요하신가요?</span> 
											<span class="turnkey-none" id="turnkey-design"><img
											src="${pageContext.request.contextPath}/resources/static/img/exclamation-circle.png" /><strong>개발</strong>도
											함께 필요하신가요?</span>
										<div class="turnkey-radio">
											<input id="turnkey_true" name="is_turnkey" type="radio"
												value="true" /><label for="turnkey_true">네</label><input
												id="turnkey_false" name="is_turnkey" type="radio"
												value="false" /><label for="turnkey_false">아니오</label>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group " id="title_div">
								<label class="control-label required" for="title"><span>*</span>프로젝트
									제목</label>
								<div class="control-wrapper">
									<input autocomplete="off" class="form-control" id="title"
										maxlength="30" name="title" required="required" size="30"
										type="text" /><span class="help-block">프로젝트 제목을 입력해
										주세요. (30자 이내)</span>
									<span class="help-block">${title_msg}</span>
								</div>
							</div>
							<div class="form-group project-term-form-group " id="project_term_div">
								<label class="control-label required" for="project_term"><span>*</span>예상
									기간</label>
								<div class="control-wrapper">
									<div class="input-group">
										<input autocomplete="off" class="form-control"
											id="project_term" name="project_term" required="required"
											maxlength="3" type="text" /><span class="input-group-addon">일</span>
									</div>
									<span class="help-block">프로젝트를 진행할 기간을 일 단위로 입력해 주세요.
										(최대 3자리)</span>
									<span class="help-block">${project_term_msg}</span>
								</div>
							</div>
							<div class="form-group project-term-form-group " id="budget_maximum_div">
								<label class="control-label required" for="budget_maximum"><span>*</span>지출
									가능 예산</label>
								<div class="control-wrapper">
									<div class="input-group">
										<input autocomplete="off" class="form-control"
											id="budget_maximum" name="budget_maximum"
											required="required" type="text" /><span
											class="input-group-addon">원</span>
									</div>
									<span class="help-block">지출 가능한 예산을 입력해 주세요. ( VAT 별도, 예
										: 100,000,000)</span>
									<span class="help-block">${budget_maximum_msg}</span>
								</div>
							</div>
							<div class="form-group description-form-group " id="planning_status_div">
								<label class="control-label required" for="planning_status"><span>*</span>
									기획 상태</label>
								<div class="control-wrapper">
									<input id="planning_keeper" name="planning_keeper"
										type="hidden" value="" />
									<ul>
										<li><label for="planning_status_1"><div
													class="radio-no-selected one" id="radio-one"
													onclick="check_plan();">
													<input id="planning_status_1" name="planning_status"
														onclick="check_plan();" required="" type="radio"
														value="idea" /><br />
													<label class="radio-inline" for="planning_status_1">아이디어만
														있습니다.</label>
												</div></label></li>
										<li><label for="planning_status_2"><div
													class="radio-no-selected two" id="radio-two"
													onclick="check_plan();">
													<input id="planning_status_2" name="planning_status"
														onclick="check_plan();" required="" type="radio"
														value="simple" /><br />
													<label class="radio-inline" for="planning_status_2">필요한
														내용들을 간단히<br />정리해두었습니다.
													</label>
												</div></label></li>
										<li class="last-radio"><label for="planning_status_3"><div
													class="radio-no-selected three" id="radio-three"
													onclick="check_plan();">
													<input id="planning_status_3" name="planning_status"
														onclick="check_plan();" required="" type="radio"
														value="project_book" /><br />
													<label class="radio-inline" for="planning_status_3">상세한
														기획 문서가<br />존재합니다.
													</label>
												</div></label></li>
									</ul>
									<span class="help-block">${planning_status_msg}</span>
									
								</div>
							</div>
							<div class="form-group description-form-group " id="description_div">
								<label class="control-label required" for="description"><span>*</span>프로젝트
									내용</label>
								<div class="control-wrapper">
									<textarea autocomplete="off" class="form-control" cols="40"
										id="description" name="description"
										required="" rows="30"></textarea>
									<span class="help-block"><p class="text-danger">
											<span class="label label-danger">주의</span> 이메일, 전화번호 등을 게시하는
											경우 서비스 이용에 제재를 받을 수 있습니다.
										</p></span>
									<span class="help-block">${description_msg}</span>
								</div>
							</div>
							<div class="form-group " id="skill_required_div">
								<label class="control-label required" for="skill_required">관련
									기술</label>
								<div class="control-wrapper">
									<input id="skill_required" name="skill_required" type="text" /><span
										class="help-block">다수의 관련 기술을 입력 할때에는 쉼표(,)로 구분해 주세요.
										(최대 5개)<br />예) Photoshop, Android, HTML5, Python, Django
									</span>
									<span class="help-block">${skill_required_msg}</span>
								</div>
							</div>
							<div class="form-group description-form-group">
								<label class="control-label"></label>
								<div class="control-wrapper">
									<div class="form-divider"></div>
								</div>
							</div>
							<div class="form-group deadline-form-group " id="deadline_div">
								<label class="control-label required" for="deadline"><span>*</span>모집
									마감일자</label>
								<div class="control-wrapper">
									<select id="deadline" name="deadline"
										required="required">
										
										<%
										for(int i=0;i<14;i++)
										{
											String result = "<option value="+Time.toString1(Time.nextDate(i))
													+">"+Time.toString2(Time.nextDate(i))+"</option>";
											out.println(result);
										}
										 %>
									</select><span
										class="help-block">지원자를 모집하는 기간입니다. 최소 1일에서 최대 14일까지
										가능합니다.</span>
								</div>
							</div>
							<div class="form-group interview-form-group " id="method_pre_interview_div">
								<label class="control-label required" for="method_pre_interview"><span>*</span>사전
									미팅</label>
								<div class="control-wrapper">
									<select id="method_pre_interview" name="method_pre_interview"
										required="required"><option selected="selected"
											value="OFFLINE">오프라인 미팅</option>
										<option value="ONLINE">온라인 미팅 (카카오톡, skype, 구글 행아웃)</option></select><span
										class="help-block">사전 미팅 방식을 선택해주세요.<br />마음에 드는 지원자와의
										미팅을 위시켓에서 주선해드립니다.
									</span>
									<span class="help-block">${method_pre_interview_msg}</span>
								</div>
							</div>
							<div class="form-group address-form-group " id="address_div">
								<label class="control-label required" for="address_sido"><span>*</span>사전
									미팅 지역</label>
								<div class="control-wrapper">
									<div class="address-wrapper">
										<select id="address_sido" name="address_sido"
											required="required"><option value="">시, 도</option>
											<option value="서울특별시">서울특별시</option>
											<option value="부산광역시">부산광역시</option>
											<option value="대구광역시">대구광역시</option>
											<option value="인천광역시">인천광역시</option>
											<option value="광주광역시">광주광역시</option>
											<option value="대전광역시">대전광역시</option>
											<option value="울산광역시">울산광역시</option>
											<option value="세종특별자치시">세종특별자치시</option>
											<option value="경기도">경기도</option>
											<option value="강원도">강원도</option>
											<option value="충청북도">충청북도</option>
											<option value="충청남도">충청남도</option>
											<option value="전라북도">전라북도</option>
											<option value="전라남도">전라남도</option>
											<option value="경상북도">경상북도</option>
											<option value="경상남도">경상남도</option>
											<option value="제주특별자치도">제주특별자치도</option></select><select id="sigungu"
											name="sigungu" required="required"><option
												value="">시, 군, 구</option></select>
									</div>
									<span class="help-block">사전 미팅을 진행할 지역을 선택해 주세요</span>
									<span class="help-block">${address_msg}</span>
								</div>
							</div>
							<div class="form-group address-form-group new-date-form " id="date_expected_kick_off_div">
								<label class="control-label required"
									for="date_expected_kick_off"><span>*</span>프로젝트 예상 시작일</label>
								<div class="control-wrapper">
									<select id="date_expected_kick_off"
										name="date_expected_kick_off"
										required="required">
										
										<%
										for(int i=0;i<21;i++)
										{
											String result = "<option value="+Time.toString1(Time.nextDate(i))
													+">"+Time.toString2(Time.nextDate(i))+"</option>";
											out.println(result);
										}
										 %>
										</select>
								</div>
							</div>
							<div class="form-group description-form-group">
								<label class="control-label"></label>
								<div class="control-wrapper">
									<div class="form-divider"></div>
								</div>
							</div>
							<div class="form-group manage-experience-form-group " id="has_manage_experience_div">
								<label class="control-label required"
									for="has_manage_experience"><span>*</span>프로젝트 매니징 경험</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline"
											for="has_manage_experience_1"><input
												id="has_manage_experience_1" name="has_manage_experience"
												type="radio" value="true" />예, 매니징 경험이 있습니다.</label></li>
										<li><label class="radio-inline"
											for="has_manage_experience_2"><input
												id="has_manage_experience_2" name="has_manage_experience"
												type="radio" value="false" />아니오, 없습니다.</label></li>
									</ul>
									<span class="help-block">${has_manage_experience_msg}</span>
								</div>
							</div>
							<div class="form-group prefer-partner-form-group " id="prefer_partner_div">
								<label class="control-label" for="prefer_partner">선호하는
									파트너 형태</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline" for="prefer_partner_1"><input
												id="prefer_partner_1" name="prefer_partner" type="radio"
												value="whatever" />상관 없음</label></li>
										<li><label class="radio-inline" for="prefer_partner_2"><input
												id="prefer_partner_2" name="prefer_partner" type="radio"
												value="corporate_business" />법인 사업자</label></li>
										<li><label class="radio-inline" for="prefer_partner_3"><input
												id="prefer_partner_3" name="prefer_partner" type="radio"
												value="individual_business" />개인 사업자</label></li>
										<li><label class="radio-inline" for="prefer_partner_4"><input
												id="prefer_partner_4" name="prefer_partner" type="radio"
												value="team" />팀</label></li>
										<li><label class="radio-inline" for="prefer_partner_5"><input
												id="prefer_partner_5" name="prefer_partner" type="radio"
												value="individual" />개인</label></li>
									</ul>
									<span class="help-block">${prefer_partner_msg}</span>
								</div>
							</div>
							<div class="form-group prefer-partner-form-group " id="submit_purpose_div">
								<label class="control-label" for="submit_purpose">프로젝트
									의뢰 목적</label>
								<div class="control-wrapper">
									<ul class="list-unstyled">
										<li><label class="radio-inline" for="submit_purpose_1"><input
												id="submit_purpose_1" name="submit_purpose" type="radio"
												value="request" />프로젝트 의뢰</label></li>
										<li><label class="radio-inline" for="submit_purpose_2"><input
												id="submit_purpose_2" name="submit_purpose" type="radio"
												value="inquire" />견적 문의</label></li>
									</ul>
									<span class="help-block">${submit_purpose_msg }</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="btn-wrapper project-submit-group">
								<input id="category_keeper" name="category_keeper" type="hidden"
									value="" /><input id="value_keeper" name="value_keeper"
									type="hidden" value="" /><input id="turnkey_keeper"
									name="turnkey_keeper" type="hidden" value="" /><input
									id="sigungu_keeper" name="sigungu_keeper" type="hidden"
									value="" /><input autocomplete="off"
									class="btn btn-lg btn-client js-disable-on-click btn-submit"
									data-loading-text="제출 중" name="post_a_job" type="submit"
									value="프로젝트 등록" /><input autocomplete="off"
									class="btn btn-lg btn-default js-disable-on-click"
									data-loading-text="저장 중" name="save_for_later" type="submit"
									value="임시 저장" />
							</div>
						</div>
					</form>
					<div class="project-add-helper" style="float: left;">
						<div class="expected-time-boxer">
							<div class="expected-time-title">
								작성 완료까지 예상 시간<img class="slash"
									src="${pageContext.request.contextPath}/resources/static/img/intro/slash_blue.png" />
							</div>
							<div class="remain-time">
								<i class="fa fa-clock-o"></i> 약 <span id="remain-time-text"
									style="font-weight: bold;">4분</span> 소요 예정
							</div>
							<div id="progressbar"></div>
							<br />
							<div class="maximum-time">최대 10분</div>
						</div>
						<div class="project-add-info">
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="${pageContext.request.contextPath}/resources/static/img/project-add-process-one.png" />
								<div class="info-data-letter">
									위시켓은 <strong>클라이언트님께 무료</strong>로 제공 됩니다.
								</div>
							</div>
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="${pageContext.request.contextPath}/resources/static/img/project-add-process-two.png" />
								<div class="info-data-letter">
									다양한 지원자들의 <strong>견적과 포트폴리오를 한눈에 비교</strong>할 수 있습니다.
								</div>
							</div>
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="${pageContext.request.contextPath}/resources/static/img/project-add-process-three.png" />
								<div class="info-data-letter">
									<strong>온/오프라인 미팅</strong>을 통해 마음에 드는 지원자를 선택합니다.
								</div>
							</div>
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="${pageContext.request.contextPath}/resources/static/img/project-add-process-four.png" />
								<div class="info-data-letter">
									<strong>대금 보호 시스템</strong>을 통해, 돈 문제 없는 안전한 계약이 가능합니다.
								</div>
							</div>
							<div class="project-add-info-data">
								<img class="info-data-img"
									src="${pageContext.request.contextPath}/resources/static/img/project-add-process-five.png" />
								<div class="info-data-letter">
									클라이언트님의 <strong>승인 후에 파트너에게 대금이 지급</strong>됩니다.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<jsp:include page="../../footer.jsp" flush="false" />

	<script type="text/javascript">

	$(document).ready(function(){

		var title_val = "${title_val}";
		var category_val = "${category_val}";
		var sub_category_val = "${sub_category_val}";
		var is_turnkey_val = "${is_turnkey_val}";
		var project_term_val = "${project_term_val}";
		var budget_maximum_val = "${budget_maximum_val}";
		var planning_status_val = "${planning_status_val}";
		var description_val = "${description_val}";
		var skill_required_val = "${skill_required_val}";
		var deadline_val = "${deadline_val}";
		var method_pre_interview_val = "${method_pre_interview_val}";
		var address_sido_val = "${address_sido_val}";
		var sigungu_val = "${sigungu_val}";
		var date_expected_kick_off_val = "${date_expected_kick_off_val}";
		var has_manage_experience_val = "${has_manage_experience_val}";
		var prefer_partner_val = "${prefer_partner_val}";
		var submit_purpose_val = "${submit_purpose_val}";
		
		var title_msg = "${title_msg}";
		var category_msg = "${category_msg}";
		var is_turnkey_msg = "${is_turnkey_msg}";
		var project_term_msg = "${project_term_msg}";
		var budget_maximum_msg = "${budget_maximum_msg}";
		var planning_status_msg = "${planning_status_msg}";
		var description_msg = "${description_msg}";
		var skill_required_msg = "${skill_required_msg}";
		var deadline_msg = "${deadline_msg}";
		var method_pre_interview_msg = "${method_pre_interview_msg}";
		var address_msg = "${address_msg}";
		var date_expected_kick_off_msg = "${date_expected_kick_off_msg}";
		var has_manage_experience_msg = "${has_manage_experience_msg}";
		var prefer_partner_msg = "${prefer_partner_msg}";
		var submit_purpose_msg = "${submit_purpose_msg}";
		
		if(title_val != null && title_val != "")
		{
			document.getElementById("title").value = title_val;
		}
		if(title_msg != null && title_msg != "")
		{
			$("#title_div").addClass('has-error');
		}
		
		if(category_val != null && category_val != "")
		{
			var len = document.getElementById("category").length;
			for(var i=0; i<len; i++)
				{
					if(document.getElementById("category").options[i].value == category_val)
						{
							document.getElementById("category").options[i].selected = true;
							break;
						}
				}
		}
		//subcategory
		//isturnkey
		if(category_msg != null && category_msg != "")
		{
			$("#category_div").addClass('has-error');
		}
		
		if(project_term_val != null && project_term_val != "")
		{
			document.getElementById("project_term").value = project_term_val;
		}
		if(project_term_msg != null && project_term_msg != "")
		{
			$("#project_term_div").addClass('has-error');
		}
		
		if(budget_maximum_val != null && budget_maximum_val != "")
		{
			document.getElementById("budget_maximum").value = budget_maximum_val;
		}
		if(budget_maximum_msg != null && budget_maximum_msg != "")
		{
			$("#budget_maximum_div").addClass('has-error');
		}
		
		if(planning_status_val != null && planning_status_val != "")
		{
			if(planning_status_val == "idea")
				$("#planning_status_1").attr("checked","checked");
			else if(planning_status_val == "simple")
				$("#planning_status_1").attr("checked","checked");
			else if(planning_status_val == "project_book")
				$("#planning_status_1").attr("checked","checked");
		}
		if(planning_status_msg != null && planning_status_msg != "")
		{
			$("#planning_status_div").addClass('has-error');
		}
		
		if(description_val != null && description_val != "")
		{
			document.getElementById("description").value = description_val;
		}
		if(description_msg != null && description_msg != "")
		{
			$("#description_div").addClass('has-error');
		}
		
		if(skill_required_val != null && skill_required_val != "")
		{
			document.getElementById("skill_required").value = skill_required_val;
		}
		if(skill_required_msg != null && skill_required_msg != "")
		{
			$("#skill_required_div").addClass('has-error');
		}
		
		//deadline
		
		if(method_pre_interview_val != null && method_pre_interview_val != "")
		{

			var len = document.getElementById("method_pre_interview").length;
			for(var i=0; i<len; i++)
			{
				if(document.getElementById("method_pre_interview").options[i].value == method_pre_interview_val)
					{
						document.getElementById("method_pre_interview").options[i].selected = true;
						break;
					}
			}
		}
		if(method_pre_interview_msg != null && method_pre_interview_msg != "")
		{
			$("#method_pre_interview_div").addClass('has-error');
		}
		
		if(address_msg != null && address_msg != "")
			{
			$("#address_div").addClass('has-error');
			}
		
		if(has_manage_experience_val != null && has_manage_experience_val != "")
		{
			if(has_manage_experience_val == "true")
				$("#has_manage_experience_1").attr("checked","checked");
			else if(has_manage_experience_val == "false")
				$("#has_manage_experience_2").attr("checked","checked");
		}
		if(has_manage_experience_msg != null && has_manage_experience_msg != "")
		{
			$("#has_manage_experience_div").addClass('has-error');
		}
		
		if(prefer_partner_val != null && prefer_partner_val != "")
		{
			if(prefer_partner_val == "whatever")
				$("#prefer_partner_1").attr("checked","checked");
			else if(prefer_partner_val == "corporate_business")
				$("#prefer_partner_2").attr("checked","checked");
			else if(prefer_partner_val == "individual_business")
				$("#prefer_partner_3").attr("checked","checked");
			else if(prefer_partner_val == "team")
				$("#prefer_partner_4").attr("checked","checked");
			else if(prefer_partner_val == "individual")
				$("#prefer_partner_5").attr("checked","checked");
		}
		if(prefer_partner_msg != null && prefer_partner_msg != "")
		{
			$("#prefer_partner_div").addClass('has-error');
		}
		
		if(submit_purpose_val != null && submit_purpose_val != "")
		{
			if(submit_purpose_val == "request")
				$("#submit_purpose_1").attr("checked","checked");
			else if(submit_purpose_val == "inquire")
				$("#submit_purpose_2").attr("checked","checked");
		}
		if(submit_purpose_msg != null && submit_purpose_msg != "")
		{
			$("#submit_purpose_div").addClass('has-error');
		}
		
	});
	window.onload = function(){

        var value = "<프로젝트 진행 방식>\n예시) 시작시점에 미팅, 주 1회 미팅 등\n\n"
                +"<프로젝트의 현재 상황>\n예시) 기획 여부, 타겟 고객, 진행 계획 등"
                +"\n\n<상세한 업무 내용>\n예시) 페이지 수, 레이아웃(비슷한 페이지) 수, 필요한 조건 등"
                +"\n\n<참고자료 / 유의사항>";
        var $description = $('#description');
        if($description.val() =="")
        	$description.val(value);
        
	}
    function reset_plan(){
        var one = document.getElementById('radio-one');
        var two = document.getElementById('radio-two');
        var three = document.getElementById('radio-three');
        var keeper = document.getElementById('planning_keeper');
        var one_check = document.getElementById('planning_status_1');
        var two_check = document.getElementById('planning_status_2');
        var three_check = document.getElementById('planning_status_3');
        one_check.checked = false;
        two_check.checked = false;
        three_check.checked = false;
        keeper.value = 0;
        one.className = "radio-no-selected one";
        two.className = "radio-no-selected two";
        three.className = "radio-no-selected three";
    }

    function check_plan(){
        var one_check = document.getElementById('planning_status_1');
        var one = document.getElementById('radio-one');
        var two_check = document.getElementById('planning_status_2');
        var two = document.getElementById('radio-two');
        var three_check = document.getElementById('planning_status_3');
        var three = document.getElementById('radio-three');
        var keeper = document.getElementById('planning_keeper');
        if (one_check.checked === true){
            one.className = "radio-selected one";
            keeper.value = 1;
        }
        else {
            one.className = "radio-no-selected one";
        }
        if (two_check.checked === true){
            two.className = "radio-selected two";
            keeper.value = 2;
        }
        else {
            two.className = "radio-no-selected two";
        }
        if (three_check.checked === true){
            three.className = "radio-selected three";
            keeper.value = 3;
        }
        else {
            three.className = "radio-no-selected three";
        }
    }

	function getCategoryM()
	{
    	$('#sub_category').html("<option value='' selected>세부 카테고리</option>");
		$('#sub_category').selecter('refresh');

		if(document.getElementById('category').value == '')
		{
			return false;
		}
		$.ajax({
			url : "/wjm/getCategoryM",
			type : "POST",
			data : 
			{
				categoryL:document.getElementById('category').value
			},
			dataType : "JSON",
			success : function(data) {
				
				if(data!=null || data!="")
				{
					var list = data.categoryMlist;
					var listLen = list.length;
					
					for(var i=0;i<listLen;i++)
					{
						$('#sub_category').append("<option value='"+list[i]+"'>"+list[i]+"</option>");
	
					}
					$('#sub_category').selecter('refresh');
				}
			},
	
			error : function(request, status, error) {
				if (request.status != '0') {
					alert("code : " + request.status + "\r\nmessage : "
							+ request.reponseText + "\r\nerror : " + error);
				}
			}
		});
	}
    
    $('#category').on('change', function() {
    	getCategoryM();
    });

    $(function () {
        $('#sub_category').on('change', function() {
	            var value = $("#category").val();
	            var check = document.getElementById('turnkey-box');
	            check.className = "turnkey-checker turnkey-none";
	            var check_dev = document.getElementById('turnkey-dev');
	            var check_design = document.getElementById('turnkey-design');
	            $('#turnkey_true').prop('checked', false);
	            $('#turnkey_false').prop('checked', false);
	            reset_plan();
	            if (value == '') {
	                check.className = "turnkey-checker turnkey-show";
	                check_dev.className = "turnkey-none";
	                check_design.className = "turnkey-show";
	            }
	            else {
	                check.className = "turnkey-checker turnkey-show";
	                check_dev.className = "turnkey-show";
	                check_design.className = "turnkey-none";
	            }
	         
        });
        if($('#planning_keeper').val()===''){

        }
        else{
            var t = $('#planning_keeper').val();
            if(t==1){
                $('.one').attr('class', 'radio-selected one');
                $('#planning_status_1').attr('checked', true);
            }
            else if(t==2){
                $('.two').attr('class', 'radio-selected two');
                $('#planning_status_2').attr('checked', true);
            }
            else if(t==3){
                $('.three').attr('class', 'radio-selected three');
                $('#planning_status_3').attr('checked', true);
            }
        }

        if($('#value_keeper').val()===''){

        }
        else{
            var check = document.getElementById('turnkey-box');
            var check_dev = document.getElementById('turnkey-dev');
            var check_design = document.getElementById('turnkey-design');
            var value_sub = $('#value_keeper').val(),
                    value_cat = $('#category').val();
            if(value_cat == 'develop'){
                check_dev.className = "turnkey-show";
                check_design.className = "turnkey-none";
            }
            else if(value_cat == 'design'){
                check_dev.className = "turnkey-none";
                check_design.className = "turnkey-show";
            }
        }
    });

    function getAddress()
    {
        value = $('#address_sido').val();

        var $selectSigungu = $('#sigungu');
        options = "<option value=''>시, 군, 구</option>";
        
        $selectSigungu.html(options);

    	if(value == '')
    	{
    		return false;
    	}
    	$.ajax({
    		url : "/wjm/getAddress",
    		type : "POST",
    		data : 
    		{
    			area:value
    		},
    		dataType : "JSON",
    		success : function(data) {
    			
    			if(data!=null || data!="")
    			{
    				var list = data.arealist;
    				var listLen = list.length;
    				
    				for(var i=0;i<listLen;i++)
    				{
    					$selectSigungu.append("<option value='"+list[i]+"'>"+list[i]+"</option>");

    				}
    				$selectSigungu.selecter('refresh');
    			}
    		},

    		error : function(request, status, error) {
    			if (request.status != '0') {
    				alert("code : " + request.status + "\r\nmessage : "
    						+ request.reponseText + "\r\nerror : " + error);
    			}
    		}
    	});
    }
    
$('#address_sido').on('change', function() {
	 getAddress();
});

    $(function() {
        $('#skill_required').tagit({
            tagLimit: 5,
            caseSensitive: false,
            preprocessTag: function(val) {
                var valueLen = val.length;
                if(valueLen > 25){
                    $('#skill_required').next().css('border-color', '#f33d12');
                    setTimeout( function() {
                        $('#skill_required').next().css('border-color', '#cccccc');
                    }, 1500);
                    return '';
                }
                if (!val) {
                    return '';
                } else if (val[valueLen-1] === ',') {
                    return val.slice(0, valueLen-1);
                } else {
                    return val;
                }
            }
        });

        $('#budget_maximum').priceFormat({
            prefix: "",
            thousandsSeparator: ",",
            centsLimit: ""
        });
    });
    $(function () {
        $('select').selecter({
            "cover": true
        });
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