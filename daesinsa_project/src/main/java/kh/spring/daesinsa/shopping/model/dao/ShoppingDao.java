package kh.spring.daesinsa.shopping.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.daesinsa.shopbasket.domain.Shopbasket;
import kh.spring.daesinsa.shopping.domain.ProductImg;
import kh.spring.daesinsa.shopping.domain.ProductQna;
import kh.spring.daesinsa.shopping.domain.ProductReview;
import kh.spring.daesinsa.shopping.domain.Shopping;
import kh.spring.daesinsa.shopping.domain.WishList;

@Repository
public class ShoppingDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	//0. 쇼핑 상품 카테고리별 전체 갯수(페이징처리용)
	public int selectCaTotal(String c_id) {
		return sqlsession.selectOne("Shopping.selectCaTotal",c_id);
	}
	
	//메인 최신상품 목록 조회
	public List<Shopping> selectNewProductList(){
		return sqlsession.selectList("Shopping.selectNewProductList");
	}
	
	//메인 추천상품 목록 조회
	public List<Shopping> selectRecommendProductList(){
		return sqlsession.selectList("Shopping.selectRecommendProductList");
	}
	
	// 1. 쇼핑상품 전체 목록 조회
	public List<Shopping> selectListAll(){
		return sqlsession.selectList("Shopping.selectListAll");
	}
	
//	//1-1.쇼핑 상품 카테고리별 조회
//	public List<Shopping> selectListCa(Shopping shopping ,int currentPage, int pageSize){
//		return sqlsession.selectList("Shopping.selectListCa",shopping
//				,new RowBounds((currentPage-1)*pageSize,pageSize)
//				);
//	}
	
	
	//1-1.쇼핑 상품 카테고리별 조회
		public List<Shopping> selectListCa(Shopping shopping ,int currentPage, int pageSize){
			List<Shopping> shoppinglist = sqlsession.selectList("Shopping.selectListCa",shopping
					,new RowBounds((currentPage-1)*pageSize,pageSize)
					);
			for(Shopping svo : shoppinglist) {
				List<ProductImg> pImg = sqlsession.selectList("Shopping.selectListCaImg", svo.getP_id());
				svo.setP_img_list(pImg);
			}
			return shoppinglist;
		}
		
	//최신상품순 
	public List<Shopping> selectListCaNew(Shopping shopping ,int currentPage, int pageSize){
		List<Shopping> shoppingNewlist = sqlsession.selectList("Shopping.selectListCaNew",shopping
			,new RowBounds((currentPage-1)*pageSize,pageSize)
			);
	for(Shopping svo : shoppingNewlist) {
		List<ProductImg> pImg = sqlsession.selectList("Shopping.selectListCaNewImg", svo.getP_id());
		svo.setP_img_list(pImg);
			}
			return shoppingNewlist;
		}

	//1-2. 낮은가격순
	public List<Shopping> selectListCaMin(Shopping shopping ,int currentPage, int pageSize){
		List<Shopping> shoppingMinlist = sqlsession.selectList("Shopping.selectListCaMin",shopping
				,new RowBounds((currentPage-1)*pageSize,pageSize)
				);
		for(Shopping svo : shoppingMinlist) {
			List<ProductImg> pImg = sqlsession.selectList("Shopping.selectListCaMinImg", svo.getP_id());
			svo.setP_img_list(pImg);
		}
		return shoppingMinlist;
	}
	
	
	//1-3. 높은가격순
	public List<Shopping> selectListCaMax(Shopping shopping ,int currentPage, int pageSize){
		List<Shopping> shoppingMaxlist = sqlsession.selectList("Shopping.selectListCaMax",shopping
				,new RowBounds((currentPage-1)*pageSize,pageSize)
				);
		for(Shopping svo : shoppingMaxlist) {
			List<ProductImg> pImg = sqlsession.selectList("Shopping.selectListCaMaxImg", svo.getP_id());
			svo.setP_img_list(pImg);
		}
		return shoppingMaxlist;
	}
	
	//2. 쇼핑상품 상세 조회
	public Shopping detailProduct(Shopping shopping) {
		return sqlsession.selectOne("Shopping.detailProduct",shopping);
	}
	
	
	//3-1.쇼핑 상품 검색 시 전체 개수(검색용)
	public int selectSearchTotal(String keyword) {
		return sqlsession.selectOne("Shopping.selectSearchTotal",keyword);
	}
	//3-2. 쇼핑 상품 검색
	public List<Shopping> searchProduct(String keyword) {
		return sqlsession.selectList("Shopping.searchProduct",keyword);
	}
	
	//4-1. 상품 qna 
	public List<ProductQna> selectQnaList(ProductQna pQna){
		return sqlsession.selectList("Shopping.selectQnaList",pQna);
	}
	
	//4-2. 상품 qna 전체 개수
	public int selectQnaTotal(ProductQna pQna) {
		return sqlsession.selectOne("Shopping.selectQnaTotal",pQna);
	}
	
	//4-3. 상품 qna 작성
	public int pQnaInsertDo(ProductQna pQna) {
		return sqlsession.insert("Shopping.pQnaInsertDo",pQna);
	}
	
	//4-4-1. 상품 qna 답변 원글 확인
	public ProductQna selectProductQna(ProductQna pQna) {
		return sqlsession.selectOne("Shopping.selectProductQna",pQna );
	}
	//4-4-2. 상품 qna 답변
		public int pQnaAnswerDo(ProductQna pQna) {
			return sqlsession.insert("Shopping.pQnaAnswerDo",pQna);
		}
		
	//4-4-3. 상품 문의 삭제
	public int pQnaDeleteDo(int pq_qref) {
		return sqlsession.delete("Shopping.pQnaDeleteDo",pq_qref);
	}
	
	
	//5-1. 상품 리뷰
	public List<ProductReview> selectReviewList(ProductReview pReview){
		return sqlsession.selectList("Shopping.selectReviewList",pReview);
	}
	
	//5-2. 상품 리뷰 전체 개수
	public int selectReviewTotal(ProductReview pReview) {
		return sqlsession.selectOne("Shopping.selectReviewTotal",pReview);
	}
	
	//6. 장바구니 추가
	public int insertShopBasket(Shopbasket shopbasket) {
		return sqlsession.insert("Shopping.insertShopBasket",shopbasket);
		
	}
	
	//7-1. 위시리스트 추가
	public int insertWishList(WishList wishlist) {
		return sqlsession.insert("Shopping.insertWishList",wishlist);
	}
	
	//7-2. 위시리스트 확인용
	public WishList selectWish(WishList wishlist) {
		return sqlsession.selectOne("Shopping.selectWish", wishlist);
	}
	
	//7-3. 위시리스트 삭제
	public int deleteWishList(WishList wishlist) {
		return sqlsession.delete("Shopping.deleteWishList", wishlist);
	}
	
	//7-4. 위시리스트 목록
	public List<Shopping> listWishList(String username) {
		return sqlsession.selectList("Shopping.listWishList", username);
	}
}
