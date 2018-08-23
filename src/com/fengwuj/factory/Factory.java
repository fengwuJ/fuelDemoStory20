package com.fengwuj.factory;

import com.fengwuj.Dao.Dao;
import com.fengwuj.daoimpl.MysqlDao;

public class Factory {
	public static Dao createMysqlDao() {
		return new MysqlDao();
	}
}
