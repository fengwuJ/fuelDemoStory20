package com.fengwuj.daoimpl;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.enterprise.inject.New;

import com.fengwuj.Dao.*;
import com.fengwuj.entity.Cgsq;
import com.fengwuj.entity.Djczjl;
import com.fengwuj.entity.User;
import com.fengwuj.entity.Zbsh;
import com.fengwuj.entity.Zzjgxd;
import com.fengwuj.util.DBConnection;
import com.mysql.cj.xdevapi.SqlDataResult;

public class MysqlDao implements Dao{
	
	@Override
	public User selectUser(String name) {
		String sql = "select * from user where username = ?";
		User user = new User();
		Connection conn = null;
		try {
			conn = DBConnection.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setXm(rs.getString("xm"));
				user.setDw(rs.getString("dw"));
				user.setBm(rs.getString("bm"));
				user.setDh(rs.getString("dh"));
				user.setJs(rs.getString("js"));
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public int updateUser(User user) {
		String sql = "update user set xm = ?,dw = ?,bm = ?,dh = ? where username = ?";
		int i = 0;
		Connection connection = null;
		PreparedStatement psmt = null;
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			
			psmt.setString(1,user.getXm());
			psmt.setString(2,user.getDw());
			psmt.setString(3,user.getBm());
			psmt.setString(4,user.getDh());
			psmt.setString(5,user.getUsername());
			
			i = psmt.executeUpdate();
			
			connection.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return i;
	}

	@Override
	public int deleteUser(String username) {
		String sql = "delete from user where username = ?";
		int i = 0;
		Connection connection = null;
		PreparedStatement psmt = null;
		
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			psmt.setString(1, username);
			
			i = psmt.executeUpdate();
			
			connection.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return i;
	}

	@Override
	public int updateUserPassword(String username, String newpassword) {
		
		String sql = "update user set password = ? where username = ?";
		int i = 0;
		Connection connection = null;
		PreparedStatement psmt = null;
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			
			psmt.setString(1,newpassword);
			psmt.setString(2,username);
			
			i = psmt.executeUpdate();
			
			
			connection.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
		
	}

	@Override
	public ArrayList<Cgsq> selectCgxqList(int status, int startRow) {
		
		ArrayList<Cgsq> cgxqList = new ArrayList<Cgsq>();
		Connection connection = null;
		PreparedStatement psmt = null;
		String sql = null;
		try {
			connection = DBConnection.getConnection();
			if (status == 0) {
				sql = "select * from cgsqtable limit ?,2";
				psmt = connection.prepareStatement(sql);
				psmt.setInt(1, startRow);
			}else if(status == 1){
				sql = "select * from cgsqtable where status = ? limit ?,2";
				psmt = connection.prepareStatement(sql);
				psmt.setString(1, "待审核");
				psmt.setInt(2, startRow);
			}else {
				sql = "select * from cgsqtable where status = ? limit ?,2";
				psmt = connection.prepareStatement(sql);
				psmt.setString(1, "已发布");
				psmt.setInt(2, startRow);
			}
			ResultSet rs = psmt.executeQuery();
			while(rs.next()){
				Cgsq cgsq = new Cgsq();
				cgsq.setId(rs.getInt("id"));
				cgsq.setTn(rs.getString("tn"));
				cgsq.setTime(rs.getDate("time"));
				cgsq.setCoalType(rs.getString("coaltype"));
				cgsq.setNumber(rs.getDouble("number"));
				cgsq.setJsfs(rs.getString("jsfs"));
				cgsq.setFqr(rs.getString("fqr"));
				cgsq.setCz(rs.getString("cz"));
				cgsq.setStatus(rs.getString("status"));
				cgsq.setSprq(rs.getDate("sprq"));
				cgsq.setRkz(rs.getDouble("rkz"));
				cgxqList.add(cgsq);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return cgxqList;
	}

	@Override
	public ArrayList<Cgsq> selectCgxqListByTn(String tn) {
		ArrayList<Cgsq> cgxqList = new ArrayList<Cgsq>();
		Connection connection = null;
		PreparedStatement psmt = null;
		String sql = "select * from cgsqtable where tn = ?";
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			psmt.setString(1, tn);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()){
				Cgsq cgsq = new Cgsq();
				cgsq.setId(rs.getInt("id"));
				cgsq.setTn(rs.getString("tn"));
				cgsq.setTime(rs.getDate("time"));
				cgsq.setCoalType(rs.getString("coaltype"));
				cgsq.setNumber(rs.getDouble("number"));
				cgsq.setJsfs(rs.getString("jsfs"));
				cgsq.setFqr(rs.getString("fqr"));
				cgsq.setCz(rs.getString("cz"));
				cgsq.setStatus(rs.getString("status"));
				cgsq.setSprq(rs.getDate("sprq"));
				cgsq.setRkz(rs.getDouble("rkz"));
				cgxqList.add(cgsq);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cgxqList;
	}

	

	@Override
	public ArrayList<Cgsq> selectCgxqListByTandD(String tn, String dcmc) {
		ArrayList<Cgsq> cgxqList = new ArrayList<Cgsq>();
		Connection connection = null;
		PreparedStatement psmt = null;
		String sql = "select * from cgsqtable where tn = ? and fqr = ?";
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			psmt.setString(1, tn);
			psmt.setString(2, dcmc);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()){
				Cgsq cgsq = new Cgsq();
				cgsq.setId(rs.getInt("id"));
				cgsq.setTn(rs.getString("tn"));
				cgsq.setTime(rs.getDate("time"));
				cgsq.setCoalType(rs.getString("coaltype"));
				cgsq.setNumber(rs.getDouble("number"));
				cgsq.setJsfs(rs.getString("jsfs"));
				cgsq.setFqr(rs.getString("fqr"));
				cgsq.setCz(rs.getString("cz"));
				cgsq.setStatus(rs.getString("status"));
				cgsq.setSprq(rs.getDate("sprq"));
				cgsq.setRkz(rs.getDouble("rkz"));
				cgxqList.add(cgsq);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cgxqList;
	}

	@Override
	public int selectCgxqPage(int status) {
		Connection connection = null;
		PreparedStatement psmt = null;
		double row = 0;
		String sql = null;
		int totalPage = 0;
		try {
			connection = DBConnection.getConnection();
			if (status == 0) {
				sql = "select * from cgsqtable";
				psmt = connection.prepareStatement(sql);
			}else if(status == 1){
				sql = "select * from cgsqtable where status = ?";
				psmt = connection.prepareStatement(sql);
				psmt.setString(1, "待审核");
			}else {
				sql = "select * from cgsqtable where status = ?";
				psmt = connection.prepareStatement(sql);
				psmt.setString(1, "已发布");
			}
			ResultSet rs = psmt.executeQuery();
			while(rs.next()){
				row += 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		totalPage = (int)Math.ceil(row/2);
		return totalPage;
	}

	@Override
	public int selectCgxqPage(String dcmc) {
		Connection connection = null;
		PreparedStatement psmt = null;
		String sql = "select * from cgsqtable where fqr = ?";
		double row = 0;
		int totalPage = 0;
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			psmt.setString(1, dcmc);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()){
				row += 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		totalPage = (int)Math.ceil(row/2);
		return totalPage;
	}

	@Override
	public ArrayList<Cgsq> selectCgxqListByDcmc(String dcmc,int startRow) {
		ArrayList<Cgsq> cgxqList = new ArrayList<Cgsq>();
		Connection connection = null;
		PreparedStatement psmt = null;
		String sql = "select * from cgsqtable where fqr = ? limit ?,2";
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			psmt.setString(1, dcmc);
			psmt.setInt(2, startRow);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()){
				Cgsq cgsq = new Cgsq();
				cgsq.setId(rs.getInt("id"));
				cgsq.setTn(rs.getString("tn"));
				cgsq.setTime(rs.getDate("time"));
				cgsq.setCoalType(rs.getString("coaltype"));
				cgsq.setNumber(rs.getDouble("number"));
				cgsq.setJsfs(rs.getString("jsfs"));
				cgsq.setFqr(rs.getString("fqr"));
				cgsq.setCz(rs.getString("cz"));
				cgsq.setStatus(rs.getString("status"));
				cgsq.setSprq(rs.getDate("sprq"));
				cgsq.setRkz(rs.getDouble("rkz"));
				cgxqList.add(cgsq);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cgxqList;
	}

	@Override
	public ArrayList<Djczjl> selectShjl(String tn) {
		String sql = "select * from djczjltable where tn = ?";
		ArrayList<Djczjl> dlist = new ArrayList<Djczjl>();
		Connection connection = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		//查询单据操作记录表，可多条数据
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			psmt.setString(1, tn);
			rs = psmt.executeQuery();
			while (rs.next()) {
				//初始化单据操作记录的实体类
				Djczjl djczjl = new Djczjl();
				djczjl.setId(rs.getInt("id"));
				djczjl.setCzry(rs.getString("czry"));
				djczjl.setDw(rs.getString("dw"));
				djczjl.setTn(rs.getString("tn"));
				djczjl.setCz(rs.getString("cz"));
				djczjl.setSpyj(rs.getString("spyj"));
				djczjl.setCzsj(rs.getTimestamp("czsj"));
				djczjl.setBzly(rs.getString("bzly"));
				dlist.add(djczjl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dlist;
	}

	@Override
	public ArrayList<Zzjgxd> selectZbxdList(String status, int currentPage) {
		int startRow = (currentPage-1)*2;
		String sql = null;
		boolean all = false;
		if ("全部".equals(status)) {
			all = true;
			sql = "select * from zzjgxdtable limit ?,2";
		}else {
			sql = "select * from zzjgxdtable where status = ?  limit ?,2";
		}
		Connection connection = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ArrayList<Zzjgxd> list = new ArrayList<Zzjgxd>();
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			if (all) {
				psmt.setInt(1, startRow);
			}else {
				psmt.setString(1, status);
				psmt.setInt(2, startRow);
			}
			
			rs = psmt.executeQuery();
			while(rs.next()){
				Zzjgxd zzjgxd = new Zzjgxd();
				zzjgxd.setId(rs.getInt("id"));
				zzjgxd.setTn(rs.getString("tn"));
				zzjgxd.setTime(rs.getDate("time"));
				zzjgxd.setCoalType(rs.getString("coaltype"));
				zzjgxd.setNumber(rs.getDouble("number"));
				zzjgxd.setYsfs(rs.getString("ysfs"));
				zzjgxd.setFrl(rs.getString("frl"));
				zzjgxd.setCz(rs.getString("cz"));
				zzjgxd.setXdrq(rs.getDate("xdrq"));
				zzjgxd.setStatus(rs.getString("status"));
				zzjgxd.setGysname(rs.getString("gysname"));
				list.add(zzjgxd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int selectCgxdlbPages(String status) {
		String sql = null;
		boolean all = false;
		if ("全部".equals(status)) {
			all = true;
			sql = "select * from zzjgxdtable";
		}else {
			sql = "select * from zzjgxdtable where status = ?";
		}
		Connection connection = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		double count = 0;
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			if(!all){
				psmt.setString(1, status);
			}
			rs = psmt.executeQuery();
			while(rs.next()){
				count += 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int totalPage = (int)Math.ceil(count/2);
		return totalPage;
	}

	@Override
	public ArrayList<Zzjgxd> selectCgxdList(int currentPage, String tn, String gysname) {
		int startRow = (currentPage-1)*2;
		String sql = null;
		boolean flag = false;
		if ("".equals(tn)) {
			flag = true;
			sql = "select * from zzjgxdtable where gysname = ? limit ?,2";
		}else {
			sql = "select * from zzjgxdtable where tn = ?  limit ?,2";
		}
		Connection connection = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ArrayList<Zzjgxd> list = new ArrayList<Zzjgxd>();
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			if (flag) {
				psmt.setString(1, gysname);
			}else {
				psmt.setString(1, tn);
				
			}
			psmt.setInt(2, startRow);
			rs = psmt.executeQuery();
			while(rs.next()){
				Zzjgxd zzjgxd = new Zzjgxd();
				zzjgxd.setId(rs.getInt("id"));
				zzjgxd.setTn(rs.getString("tn"));
				zzjgxd.setTime(rs.getDate("time"));
				zzjgxd.setCoalType(rs.getString("coaltype"));
				zzjgxd.setNumber(rs.getDouble("number"));
				zzjgxd.setYsfs(rs.getString("ysfs"));
				zzjgxd.setFrl(rs.getString("frl"));
				zzjgxd.setCz(rs.getString("cz"));
				zzjgxd.setXdrq(rs.getDate("xdrq"));
				zzjgxd.setStatus(rs.getString("status"));
				zzjgxd.setGysname(rs.getString("gysname"));
				list.add(zzjgxd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int ssCgxdlbPages(String gysname) {
		String sql = null;
		sql = "select * from zzjgxdtable where gysname = ?";
		Connection connection = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		double count = 0;
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			psmt.setString(1, gysname);
			rs = psmt.executeQuery();
			while(rs.next()){
				count += 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int totalPage = (int)Math.ceil(count/2);
		return totalPage;
	}

	@Override
	public ArrayList<Zbsh> selectZbshList(int currentPage,String gysname,String tn) {
		String secondSpace = null;
		String sql = null;
		int startRow = (currentPage-1)*2;
		ArrayList<Zbsh> list = new ArrayList<Zbsh>();
		boolean flag = false;
		if (("".equals(gysname)) && ("".equals(tn))) {
			flag = true;
			sql = "select * from zzshtable limit ?,2";
		}
		if(!("".equals(gysname)) && ("".equals(tn))){
			secondSpace = gysname;
			sql = "select * from zzshtable where gysname = ? limit ?,2";
		}
		if(!("".equals(tn))){
			secondSpace = tn;
			sql = "select * from zzshtable where tn = ? limit ?,2";
		}
		
		Connection connection = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			if (flag) {
				psmt.setInt(1, startRow);
			}else {
				psmt.setString(1, secondSpace);
				psmt.setInt(2, startRow);
			}
			rs = psmt.executeQuery();
			while(rs.next()){
				Zbsh zzsh = new Zbsh();
				zzsh.setId(rs.getInt("id"));
				zzsh.setTn(rs.getString("tn"));
				zzsh.setTime(rs.getDate("time"));
				zzsh.setCoalType(rs.getString("coaltype"));
				zzsh.setNumber(rs.getDouble("number"));
				zzsh.setYsfs(rs.getString("ysfs"));
				zzsh.setFrl(rs.getString("frl"));
				zzsh.setCz(rs.getString("cz"));
				zzsh.setStatus(rs.getString("status"));
				zzsh.setStatus(rs.getString("gysname"));
				list.add(zzsh);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public int getZbshlbTotalPage() {
		String sql = "select * from zzshtable";
		int count = 0;
		Connection connection = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				count += 1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int totalPage = (int)Math.ceil(count/2);
		return totalPage;
		
	}

	@Override
	public int getZbshlbTotalPage(String gysname) {
		String sql = "select * from zzshtable where gysname = ?";
		int count = 0;
		Connection connection = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			psmt.setString(1, gysname);
			rs = psmt.executeQuery();
			while(rs.next()){
				count += 1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int totalPage = (int)Math.ceil(count/2);
		return totalPage;
	}
	
}
