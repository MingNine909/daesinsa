package kh.spring.daesinsa.shopbasket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.daesinsa.shopbasket.domain.Shopbasket;

@Repository
public class ShopbasketDao {

	@Autowired
	private SqlSession sqlsession;
	
	//��ٱ��� ��� ��ȸ
//	public List<Shopbasket>(String c_id){
//		return sqlsession.selectList
//		
//	}
	
	
	
}

