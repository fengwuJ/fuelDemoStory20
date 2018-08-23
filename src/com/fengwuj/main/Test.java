package com.fengwuj.main;

import com.fengwuj.Dao.Dao;
import com.fengwuj.entity.User;
import com.fengwuj.factory.*;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Dao dao = Factory.createMysqlDao();
		User user = dao.selectUser("root");
		System.out.println(user.getId() + "\n" + user.getUsername() + "\n" + user.getPassword());
	}

}
