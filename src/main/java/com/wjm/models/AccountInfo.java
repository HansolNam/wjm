package com.wjm.models;

import java.sql.Timestamp;
import java.util.List;

public class AccountInfo {
	private int pk;
	private String email;
	private String id;
	private String password;
	private String account_type;
	private int authorized;
	private String authorization_key;
	private Timestamp reg_date;
	private AccountInformationInfo accountinfo;
	private Partners_infoInfo partnersinfo;
	private List<TechniqueInfo> techniqueinfo;
	private int portfolionum;
	private int contractnum;
	private int assessmentnum;
	private double avg_assessment;
	private List<ProjectInfo> projectinfo;
	private AuthenticationInfo authenticationinfo;
	
	public int getAssessmentnum() {
		return assessmentnum;
	}
	public void setAssessmentnum(int assessmentnum) {
		this.assessmentnum = assessmentnum;
	}
	public int getContractnum() {
		return contractnum;
	}
	public void setContractnum(int contractnum) {
		this.contractnum = contractnum;
	}
	public Partners_infoInfo getPartnersinfo() {
		return partnersinfo;
	}
	public void setPartnersinfo(Partners_infoInfo partnersinfo) {
		this.partnersinfo = partnersinfo;
	}
	public List<TechniqueInfo> getTechniqueinfo() {
		return techniqueinfo;
	}
	public void setTechniqueinfo(List<TechniqueInfo> techniqueinfo) {
		this.techniqueinfo = techniqueinfo;
	}
	public int getPortfolionum() {
		return portfolionum;
	}
	public void setPortfolionum(int portfolionum) {
		this.portfolionum = portfolionum;
	}
	public double getAvg_assessment() {
		return avg_assessment;
	}
	public void setAvg_assessment(double avg_assessment) {
		this.avg_assessment = avg_assessment;
	}
	public List<ProjectInfo> getProjectinfo() {
		return projectinfo;
	}
	public void setProjectinfo(List<ProjectInfo> projectinfo) {
		this.projectinfo = projectinfo;
	}
	public AuthenticationInfo getAuthenticationinfo() {
		return authenticationinfo;
	}
	public void setAuthenticationinfo(AuthenticationInfo authenticationinfo) {
		this.authenticationinfo = authenticationinfo;
	}
	public AccountInformationInfo getAccountinfo() {
		return accountinfo;
	}
	public void setAccountinfo(AccountInformationInfo accountinfo) {
		this.accountinfo = accountinfo;
	}
	public AccountInfo(int pk, String email, String id, String password, String account_type, int authorized,
			String authorization_key, Timestamp reg_date) {
		super();
		this.pk = pk;
		this.email = email;
		this.id = id;
		this.password = password;
		this.account_type = account_type;
		this.authorized = authorized;
		this.authorization_key = authorization_key;
		this.reg_date = reg_date;
	}
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAccount_type() {
		return account_type;
	}
	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}
	public int getAuthorized() {
		return authorized;
	}
	public void setAuthorized(int authorized) {
		this.authorized = authorized;
	}
	public String getAuthorization_key() {
		return authorization_key;
	}
	public void setAuthorization_key(String authorization_key) {
		this.authorization_key = authorization_key;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
}
