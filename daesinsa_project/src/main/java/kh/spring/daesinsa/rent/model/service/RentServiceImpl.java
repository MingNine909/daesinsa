package kh.spring.daesinsa.rent.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.daesinsa.rent.model.dao.RentDao;
import kh.spring.daesinsa.shopping.domain.Shopping;
import kh.spring.daesinsa.shopping.model.dao.ShoppingDao;

@Service
public class RentServiceImpl implements RentService {
	
	@Autowired
	private RentDao dao;

	

	// 대여 상품 전체 조회 (페이징처리용)
	@Override
	public int selectCaRentTotal(String c_id) {
		return dao.selectCaRentTotal(c_id);
	}
	//1-1.대여 상품 카테고리별 조회
	@Override
	public List<Shopping> selectRentListCa(Shopping shopping, int currentPage, int pageSize) {
		return dao.selectRentListCa(shopping, currentPage, pageSize);
	}
	
	//3-1.대여 상품 검색 시 전체 개수(검색용)
		@Override
		public int selectSearchTotal(String keyword) {
			return dao.selectSearchTotal(keyword);
		}
	
	//3-2.대여 상품 검색
	public List<Shopping> searchRentProduct(String keyword, int currentPage, int pageSize) {
		
		return dao.searchRentProduct(keyword, currentPage, pageSize);
	}


	


}