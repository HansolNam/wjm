package com.wjm.main;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.ClientProtocolException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.AccountInformationDao;
import com.wjm.dao.AdditionDao;
import com.wjm.dao.ApplicantDao;
import com.wjm.dao.AssessmentDao;
import com.wjm.dao.ContractDao;
import com.wjm.dao.NotificationDao;
import com.wjm.dao.ProjectDao;
import com.wjm.main.function.SMS;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.AccountInformationInfo;
import com.wjm.models.AdditionInfo;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.ContractInfo;
import com.wjm.models.ProjectInfo;

import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ClientController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);

	private static final boolean Available = false;
	   
	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private AccountDao accountDao;
	@Autowired
	private AccountInformationDao accountInformationDao;
	@Autowired
	private ApplicantDao applicantDao;
	@Autowired
	private ContractDao contractDao;
	@Autowired
	private AssessmentDao assessmentDao;
	@Autowired
	private NotificationDao notificationDao;
	@Autowired
	private AdditionDao additionDao;

	@Autowired
	private JavaMailSender mailSender;
	
	//메일 전송
	public String sendMail(String from, String to, String content, String subject) {
		
		logger.info("from = "+from);
		logger.info("to = "+to);
		logger.info("content = "+content);
		logger.info("subject = "+subject);
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(to);
			messageHelper.setText(content, true);
			messageHelper.setFrom(from);
			messageHelper.setSubject(subject);	// 메일제목은 생략이 가능하다
			
			mailSender.send(message);
		} catch(Exception e){
			System.out.println(e);
			return "실패";
		}
		
		return "성공";
	}
	
	public boolean AccountCheck(AccountInfo account)
	{
		if(account.getAccount_type() == null)
			return false;
		else if(account.getAccount_type().equals("client"))
			return true;
		else
			return false;
		
	}
	/**
	 * 취소한 프로젝트
	 */
	@RequestMapping(value = "/client/manage/past/cancelled-project", method = RequestMethod.GET)
	public ModelAndView ClientController_cancelled(HttpServletRequest request, ModelAndView mv) {
		logger.info("취소한 프로젝트 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));


		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"평가대기중");
		if(projectlist!=null) mv.addObject("reviewnum",projectlist.size());

		List<ProjectInfo> projectlist2 = projectDao.selectStatus(account.getPk(),"완료한프로젝트");
		if(projectlist2!=null) mv.addObject("completednum",projectlist2.size());		

		List<ProjectInfo> projectlist3 = projectDao.selectStatus(account.getPk(),"취소한프로젝트");
		
		mv.addObject("projectlist",projectlist3);

		return mv;
	}
	/**
	 * 완료한 프로젝트
	 */
	@RequestMapping(value = "/client/manage/past/completed-contract", method = RequestMethod.GET)
	public ModelAndView ClientController_completed(HttpServletRequest request, ModelAndView mv) {
		logger.info("완료한 프로젝트 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		List<ContractInfo> reviewlist = contractDao.selectReviewClient(account.getPk(),"완료한프로젝트");
		if(reviewlist!=null) mv.addObject("reviewnum",reviewlist.size());

		List<ContractInfo> completedlist = contractDao.selectCompletedClient(account.getPk(),"완료한프로젝트");
		
		List<ProjectInfo> cancellist = projectDao.selectStatus(account.getPk(),"취소한프로젝트");
		if(cancellist!=null) mv.addObject("cancellednum",cancellist.size());

		
		mv.addObject("completedlist",completedlist);
		return mv;
	}
	/**
	 * 평가 대기중
	 */
	@RequestMapping(value = "/client/manage/past/review-contract", method = RequestMethod.GET)
	public ModelAndView ClientController_review(HttpServletRequest request, ModelAndView mv) {
		logger.info("평가 대기중 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		List<ContractInfo> reviewlist = contractDao.selectReviewClient(account.getPk(),"완료한프로젝트");
		List<ContractInfo> completedlist = contractDao.selectCompletedClient(account.getPk(),"완료한프로젝트");
		if(completedlist!=null) mv.addObject("completednum",completedlist.size());
		List<ProjectInfo> cancellist = projectDao.selectStatus(account.getPk(),"취소한프로젝트");
		if(cancellist!=null) mv.addObject("cancellednum",cancellist.size());

		
		mv.addObject("reviewlist",reviewlist);
		
		return mv;
	}
	
	/**
	 * 평가 하기 페이지
	 */
	@RequestMapping(value = "/client/manage/review/{project_pk}/{client_pk}/{partners_pk}", method = RequestMethod.GET)
	public ModelAndView ClientController_review_form(HttpServletRequest request, ModelAndView mv,
			@PathVariable("project_pk") int project_pk,
			@PathVariable("client_pk") int client_pk,
			@PathVariable("partners_pk") int partners_pk) {
		logger.info("평가 하기 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		ContractInfo contract = contractDao.select_project_client_partners(project_pk, client_pk, partners_pk);
		if(contract!= null)
		{
			if(contract.getClient_pk() != account.getPk())
			{
				logger.info("다른 사람이 해당 평가에 접근중");
				mv.setViewName("redirect:/error/404error");
				return mv;
			}
		}
		else
		{
			logger.info("해당 계약이 존재하지 않음");
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		mv.addObject("contract",contract);
		
		mv.setViewName("client/manage/review");
		
		return mv;
	}

	/**
	 * 평가 하기 처리 페이지
	 * @throws IOException 
	 * @throws URISyntaxException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value = "/client/manage/review/{project_pk}/{client_pk}/{partners_pk}", method = RequestMethod.POST)
	public ModelAndView ClientController_review_form_post(HttpServletRequest request, ModelAndView mv,
			@PathVariable("project_pk") int project_pk,
			@PathVariable("client_pk") int client_pk,
			@PathVariable("partners_pk") int partners_pk,
			@RequestParam("professionalism") String professionalism,
			@RequestParam("satisfaction") String satisfaction,
			@RequestParam("schedule_observance") String schedule_observance,
			@RequestParam("activeness") String activeness,
			@RequestParam("communication") String communication,
			@RequestParam("recommendation") String recommendation) throws ClientProtocolException, URISyntaxException, IOException {
		logger.info("평가 하기 처리 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		ContractInfo contract = contractDao.select_project_client_partners(project_pk, client_pk, partners_pk);
		if(contract!= null)
		{
			if(contract.getClient_pk() != account.getPk())
			{
				logger.info("다른 사람이 해당 평가에 접근중");
				mv.setViewName("redirect:/error/404error");
				return mv;
			}
		}
		else
		{
			logger.info("해당 계약이 존재하지 않음");
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		if(!Validator.hasValue(professionalism))
		{
			logger.info("전문선 x");
			mv.addObject("messages","전문성을 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(professionalism))
		{
			logger.info("전문선 x");
			mv.addObject("messages","전문성은 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}

		if(!Validator.hasValue(satisfaction))
		{
			logger.info("만족도 x");
			mv.addObject("messages","만족도를 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(satisfaction))
		{
			logger.info("만족도 x");
			mv.addObject("messages","만족도는 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}

		if(!Validator.hasValue(schedule_observance))
		{
			logger.info("일정준수 x");
			mv.addObject("messages","일정준수를 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(schedule_observance))
		{
			logger.info("일정준수 x");
			mv.addObject("messages","일정준수는 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}

		if(!Validator.hasValue(activeness))
		{
			logger.info("적극성 x");
			mv.addObject("messages","적극성을 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(activeness))
		{
			logger.info("적극성 x");
			mv.addObject("messages","적극성은 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}

		if(!Validator.hasValue(communication))
		{
			logger.info("의사소통 x");
			mv.addObject("messages","의사소통을 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(communication))
		{
			logger.info("의사소통 x");
			mv.addObject("messages","의사소통은 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		
		if(!Validator.hasValue(communication))
		{
			logger.info("추천한마디 x");
			mv.addObject("messages","추천한마디를 입력해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		else if(!Validator.isValidLength(recommendation, 1, 250))
		{
			logger.info("추천 한마디가 250자 넘음");
			mv.addObject("messages","추천 한 마디는 250 미만입니다.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		
		logger.info("평가생성");
		assessmentDao.create(project_pk, client_pk, partners_pk
				, Integer.parseInt(professionalism), Integer.parseInt(satisfaction), 
						Integer.parseInt(schedule_observance), Integer.parseInt(activeness), 
								Integer.parseInt(communication), recommendation);
		
		ProjectInfo project = projectDao.select_project(project_pk);
		//notification update
		//client
		notificationDao.create(account.getPk(), contract.getPartners_id()+" 파트너스를 평가하셨습니다. 프로젝트가 완료되었습니다.");
		
		AccountInformationInfo accountinfo = accountInformationDao.select(account.getPk());
        
        if(accountinfo.getSubscription() == 1)
        {
		String result = sendMail("admin@wjm.com", account.getEmail(), contract.getPartners_id()+" 파트너스를 평가하셨습니다. 프로젝트가 완료되었습니다.", "외주몬 알림 메일입니다");
		logger.info("이메일 전송 결과 = "+result);
        }
        if(accountinfo.getSms_subscription() == 1)
        {
        	String phone = "";
        	
        	if(Validator.hasValue(accountinfo.getCellphone_num()))
        		phone = accountinfo.getCellphone_num().replace("-", "");
        	
        	if(Validator.hasValue(phone))
        	{
        		SMS.sendSMS(phone, phone, 
        				contract.getPartners_id()+" 파트너스를 평가하셨습니다. 프로젝트가 완료되었습니다."
        				,"");
	    		logger.info("SMS 전송");
        	}
        }
        
        
		//partners
		notificationDao.create(partners_pk, contract.getClient_id()+" 님이 "+project.getName()+" 프로젝트의 평가를 완료하셨습니다.");
		accountinfo = accountInformationDao.select(partners_pk);
        
        if(accountinfo.getSubscription() == 1)
        {
        	AccountInfo partnersaccount = accountDao.select(partners_pk);
		String result = sendMail("admin@wjm.com", partnersaccount.getEmail(), contract.getClient_id()+" 님이 "+project.getName()+" 프로젝트의 평가를 완료하셨습니다.", "외주몬 알림 메일입니다");
		logger.info("이메일 전송 결과 = "+result);
        }

        if(accountinfo.getSms_subscription() == 1)
        {
        	String phone = "";
        	
        	if(Validator.hasValue(accountinfo.getCellphone_num()))
        		phone = accountinfo.getCellphone_num().replace("-", "");
        	
        	if(Validator.hasValue(phone))
        	{
        		SMS.sendSMS(phone, phone, 
        				contract.getClient_id()+" 님이 "+project.getName()+" 프로젝트의 평가를 완료하셨습니다."
        				,"");
	    		logger.info("SMS 전송");
        	}
        }
		mv.setViewName("redirect:/client/manage/past/completed-contract");
		
		return mv;
	}
	/**
	 * 검수중
	 */
	@RequestMapping(value = "/client/manage/project/submitted", method = RequestMethod.GET)
	public ModelAndView ClientController_submitted(HttpServletRequest request, ModelAndView mv) {
		logger.info("검수중 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account == null) {
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"검수중");
		mv.addObject("projectlist",projectlist);

		List<ProjectInfo> saved = projectDao.selectStatus(account.getPk(),"임시저장");
		if(saved == null)
			mv.addObject("savednum",0);
		else
			mv.addObject("savednum",saved.size());
		
		List<ProjectInfo> rejected = projectDao.selectStatus(account.getPk(),"등록실패");
		if(rejected == null)
			mv.addObject("rejectednum",0);
		else
			mv.addObject("rejectednum",rejected.size());
		return mv;
	}
	/**
	 * 임시 저장
	 */
	@RequestMapping(value = "/client/manage/project/saved", method = RequestMethod.GET)
	public ModelAndView ClientController_saved(HttpServletRequest request, ModelAndView mv) {
		logger.info("임시 저장 페이지");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"임시저장");
		mv.addObject("projectlist",projectlist);
		

		List<ProjectInfo> submitted = projectDao.selectStatus(account.getPk(),"검수중");

		if(submitted == null)
			mv.addObject("submittednum",0);
		else
			mv.addObject("submittednum",submitted.size());
		
		List<ProjectInfo> rejected = projectDao.selectStatus(account.getPk(),"등록실패");
		if(rejected == null)
			mv.addObject("rejectednum",0);
		else
			mv.addObject("rejectednum",rejected.size());
		
		return mv;
	}
	/**
	 * 등록 실패
	 */
	@RequestMapping(value = "/client/manage/project/rejected", method = RequestMethod.GET)
	public ModelAndView ClientController_rejected(HttpServletRequest request, ModelAndView mv) {
		logger.info("등록 실패 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"등록실패");
		mv.addObject("projectlist",projectlist);
		

		List<ProjectInfo> submitted = projectDao.selectStatus(account.getPk(),"검수중");

		if(submitted == null)
			mv.addObject("submittednum",0);
		else
			mv.addObject("submittednum",submitted.size());
		
		List<ProjectInfo> saved = projectDao.selectStatus(account.getPk(),"임시저장");
		if(saved == null)
			mv.addObject("savednum",0);
		else
			mv.addObject("savednum",saved.size());
		
		return mv;
	}
	/**
	 * 지원자 모집 중
	 */
	@RequestMapping(value = "/client/manage/recruiting", method = RequestMethod.GET)
	public ModelAndView ClientController_recruiting(HttpServletRequest request, ModelAndView mv) {
		logger.info("지원자 모집 중 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"지원자모집중");
		mv.addObject("projectlist",projectlist);
		
		return mv;
	}
	
	/**
	 * 결제 대기중인 프로젝트
	 */
	@RequestMapping(value = "/client/manage/wait", method = RequestMethod.GET)
	public ModelAndView ClientController_wait(HttpServletRequest request, ModelAndView mv) {
		logger.info("결제 대기중인 프로젝트 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));
		
		List<AdditionInfo> additionlist = additionDao.selectStatusClient(account.getPk(), "결제대기중");
		mv.addObject("additionlist",additionlist);

		List<ContractInfo> waitlist = contractDao.selectReadyClient(account.getPk(),"결제대기중");
		mv.addObject("waitlist",waitlist);
		
		return mv;
	}
	
	
	/**
	 * 진행 중인 프로젝트
	 */
	@RequestMapping(value = "/client/manage/contract-in-progress", method = RequestMethod.GET)
	public ModelAndView ClientController_progress(HttpServletRequest request, ModelAndView mv) {
		logger.info("진행 중인 프로젝트 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		
		List<ContractInfo> contractlist = contractDao.selectProgressClient(account.getPk(),"진행중");
		mv.addObject("contractlist",contractlist);
		
		return mv;
	}
	

	/**
	 * 프로젝트 지원자 목록
	 */

	@RequestMapping(value = "/client/manage/project/{name}/{pk}/applicant", method = RequestMethod.GET)
	public ModelAndView ProjectController_project_proposalapply(HttpServletRequest request, 
			@PathVariable("pk") int pk, 
			@PathVariable("name") String name, ModelAndView mv) {
		logger.info("project proposal apply get Page");
		
		if(!Validator.hasValue(name))
		{
			mv.setViewName("/project");
			return mv;
		}
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}

		ProjectInfo project = projectDao.select_project(pk);
		if(project!=null)
		{
			//지원자 보려는 사람이 프로젝트 소유자인지 확인
			if(account.getPk() != project.getAccount_pk())
			{
				mv.setViewName("/mywjm/client");
				return mv;
			}
			mv.addObject("project",project);
		}
		else
		{
			mv.setViewName("/mywjm/client");
			return mv;
		}
		
		List<ApplicantInfo> applicant = applicantDao.select_project(pk);
		
		if(applicant != null && applicant.isEmpty())
			applicant = null;
		mv.addObject("applicant", applicant);
		
		mv.setViewName("/client/manage/project/applicant");
		
		return mv;
	}
	

	//미팅 신청
	@RequestMapping(value = "/client/manage/project/meeting", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String ProjectController_getCategoryM(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("applicant_pk") int applicant_pk,
			@RequestParam("project_pk") int project_pk) throws ClientProtocolException, URISyntaxException, IOException {
		logger.info("/wjm/client/manage/project/meeting AJAX");

		
		logger.info("applicant_pk = "+applicant_pk);
		logger.info("project_pk = "+project_pk);
		JSONObject jObject = new JSONObject();
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			jObject.put("messages", "error");
			logger.info(jObject.toString());
			return jObject.toString();
		}
		if(!AccountCheck(account))
		{
			jObject.put("messages", "error");
			logger.info(jObject.toString());
			return jObject.toString();
		}
		ProjectInfo project = projectDao.select_project(project_pk);

		//프로젝트 소유자와 현재 계정이 다르다면
		if(project == null)
		{
			jObject.put("messages", "error");
			logger.info(jObject.toString());
			return jObject.toString();
		}
		if(account.getPk() != project.getAccount_pk())
		{
			jObject.put("messages", "error");
			logger.info(jObject.toString());
			return jObject.toString();
		}
		
		//해당 지원자가 존재하지 않음
		ApplicantInfo applicant = applicantDao.select(applicant_pk, project_pk);
		if(applicant == null)
		{
			jObject.put("messages", "error");
			logger.info(jObject.toString());
			return jObject.toString();
		}
		
		//최대 미팅 신청 2번
		List<ContractInfo> contractlist = contractDao.select_project_client(project_pk, account.getPk());
		if(contractlist != null)
			if(contractlist.size() >= 2)
			{
				jObject.put("messages", "미팅 신청은 최대 2번까지 가능합니다.");
				logger.info(jObject.toString());
				return jObject.toString();
			}
		
		AccountInfo applicant_account = accountDao.select(applicant_pk);
		//미팅 신청을 완료했습니다.알림
		contractDao.createMeeting(project_pk, account.getPk(), applicant_pk, project.getName()
				, account.getId(), applicant_account.getId(),"계약진행중");
		
		//알림(관리자)
		AccountInfo admin_account = accountDao.select("admin1");
		String result = sendMail("admin@wjm.com", admin_account.getEmail(), account.getId()+" 클라이언트가 "+
				applicant_account.getId()+ " 파트너스와 미팅을 요청하였습니다.", "외주몬 알림 메일입니다");
		logger.info("이메일 전송 결과 = "+result);

		AccountInformationInfo admin_accountinfo = accountInformationDao.select(admin_account.getPk());
    	String phone = "";
    	
    	if(Validator.hasValue(admin_accountinfo.getCellphone_num()))
    		phone = admin_accountinfo.getCellphone_num().replace("-", "");
    	
    	if(Validator.hasValue(phone))
    	{
    		SMS.sendSMS(phone, phone, account.getId()+" 클라이언트가 "+ applicant_account.getId()+ " 파트너스와 미팅을 요청하였습니다.","");
    		logger.info("SMS 전송");
    	}
    
		
		jObject.put("messages", "success");
		logger.info(jObject.toString());

		return jObject.toString();
	}
	
	/**
	 * 프로젝트 결제
	 */
	
	@RequestMapping(value = "/client/payment/{contract_pk}", method = RequestMethod.GET)
	public ModelAndView ClientController_payment(HttpServletRequest request, 
			@PathVariable("contract_pk") int contract_pk, 
			ModelAndView mv) {
		logger.info("프로젝트 결제 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		ContractInfo contract = contractDao.select(contract_pk);
		
		//결제 하는 사람과 계약 클라이언트 일치 확인
		if(account.getPk() != contract.getClient_pk())
		{
			mv.setViewName("redirect:/error/400error");
			return mv;
		}
		
		//////////////////////////결제 처리

		//진행중으로 상태 변경
		projectDao.updateStatus(contract.getProject_pk(),"진행중");

		mv.setViewName("redirect:/mywjm/client");
		
		return mv;
	}
	
	/**
	 * 클라이언트 정보
	 */
	@RequestMapping(value = "/client/info", method = RequestMethod.GET)
	public ModelAndView ClientController_info(HttpServletRequest request, ModelAndView mv) {
		logger.info("클라이언트 정보 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		AccountInformationInfo accountinfo = accountInformationDao.select(account.getPk());
		mv.addObject("accountinfo", accountinfo);

		return mv;
	}
	

	/**
	 * 클라이언트 정보 수정 페이지
	 */
	@RequestMapping(value = "/client/info/update", method = RequestMethod.GET)
	public ModelAndView ClientController_info_update(HttpServletRequest request, ModelAndView mv) {
		logger.info("클라이언트 정보 수정 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		AccountInformationInfo accountinfo = accountInformationDao.select(account.getPk());
		mv.addObject("accountinfo", accountinfo);

		return mv;
	}
	

	/**
	 * 클라이언트 정보 수정 처리 페이지
	 * 
	 */		
	@RequestMapping(value = "/client/info/update", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
		@ResponseBody
		public String ClientController_info_update_post(HttpServletRequest request, 
				HttpServletResponse response,
				@RequestParam("company_description") String company_description) 
		 {
			logger.info("/client/info/update AJAX");

			
			logger.info("company_description = "+company_description);
			
			JSONObject jObject = new JSONObject();
			
			AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
			if(account == null)
			{
				jObject.put("messages", "error");
				jObject.put("path", "/wjm/accounts/login");
				logger.info(jObject.toString());
				return jObject.toString();
			}
			if(!AccountCheck(account))
			{
				jObject.put("messages", "error");
				jObject.put("path", "/wjm/accounts/login");

				logger.info(jObject.toString());
				return jObject.toString();
			}
			
			if(!Validator.hasValue(company_description))
			{
				jObject.put("messages", "소개를 입력해주세요");
				logger.info(jObject.toString());
				return jObject.toString();
			}
			else if(!Validator.isValidLength(company_description,1,150))
			{
				jObject.put("messages", "소개는 최대 150자입니다.");
				logger.info(jObject.toString());
				return jObject.toString();
			}
			
			accountInformationDao.updateIntroduction(account.getPk(), company_description);
			
			jObject.put("path","/wjm/client/info");
			jObject.put("messages", "success");
			logger.info(jObject.toString());

			return jObject.toString();
		}
}
