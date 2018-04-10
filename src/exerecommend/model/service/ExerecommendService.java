package exerecommend.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import exerecommend.model.dao.ExerecommendDao;
import exerecommend.model.vo.Exerecommend;

public class ExerecommendService {
	
	public ExerecommendService() {}

	public ArrayList<Exerecommend> search(String sportbody) {
		Connection con = getConnection();
		ArrayList<Exerecommend> sportList = new ExerecommendDao().search(con, sportbody);
		close(con);
		return sportList;
	}	

}
