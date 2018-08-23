package com.fengwuj.Dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.fengwuj.entity.Cgsq;
import com.fengwuj.entity.Djczjl;
import com.fengwuj.entity.User;
import com.fengwuj.entity.Zbsh;
import com.fengwuj.entity.Zzjgxd;

public interface Dao {
	
	public User selectUser(String name);

	public int updateUser(User user);
	
	public int deleteUser(String username);
	
	public int updateUserPassword(String username,String newpassword);
	
	public ArrayList<Cgsq> selectCgxqList(int status,int startRow);
	
	public ArrayList<Cgsq> selectCgxqListByTn(String tn);
	
	public ArrayList<Cgsq> selectCgxqListByDcmc(String dcmc,int startRow);
	
	public ArrayList<Cgsq> selectCgxqListByTandD(String tn,String dcmc);
	
	public int selectCgxqPage(int status);
	
	public int selectCgxqPage(String dcmc);
	
	public ArrayList<Djczjl> selectShjl(String tn);
	
	public ArrayList<Zzjgxd> selectZbxdList(String status,int currentPage);
	
	public int selectCgxdlbPages(String status);
	
	public ArrayList<Zzjgxd> selectCgxdList(int currentPage,String tn,String gysname);
	
	public int ssCgxdlbPages(String gysname);
	
	public ArrayList<Zbsh> selectZbshList(int currentPage,String gysname,String tn);
	
	public int getZbshlbTotalPage();		
	public int getZbshlbTotalPage(String gysname);		//根据电厂名称总页数
}
