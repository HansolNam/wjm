package com.wjm.idao;

import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import com.wjm.models.EducationInfo;

public interface EducationIDao {
	void setDataSource(DataSource ds);
	void create(int account_pk,String school_name,String major,String level,String state,Timestamp start_date,Timestamp end_date);
	List<EducationInfo> selectAll();
	List<EducationInfo> select(int account_pk);
	void deleteAll();
	void delete(int pk);
}