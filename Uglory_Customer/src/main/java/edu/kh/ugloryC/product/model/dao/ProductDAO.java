package edu.kh.ugloryC.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.product.model.vo.OptionType;
import edu.kh.ugloryC.product.model.vo.ProductDetail;
import edu.kh.ugloryC.product.model.vo.ProductOrder;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 상품 상세조회 DAO
	 * @param productCode
	 * @return detail
	 */
	public ProductDetail productDetail(int productCode) {
		
		return sqlSession.selectOne("productMapper.productDetail", productCode);
	}

//	/** 총 가격 조회 DAO
//	 * @param map
//	 * @return result
//	 */
//	public int totalAmount(Map<String, Object> map) {
//		return sqlSession.selectOne("productMapper.totalAmount", map);
//	}


	/** 주문 페이지 내 옵션에 따른 상품, 옵션 조회 DAO
	 * @param map
	 * @return selectOptionList
	 */
	public List<OptionType> orderOptionSelect(Map<String, Object> map) {

		return sqlSession.selectList("productMapper.orderOptionSelect", map);
	}
	
	/** 주문 정보 DAO
	 * @param productOrder
	 * @return result
	 */
	public int productOrder(Map<String, Object> productOrder) {

		return sqlSession.insert("productMapper.productOrder", productOrder);
	}

	/** 상품 주문번호 생성
	 * @return pOrderCode
	 */
	public String createProductOrderCode() {

		return sqlSession.selectOne("productMapper.createProductOrderCode");
	}

	
	/** 결제 정보 삽입
	 * @param productOrder
	 * @return productOrder
	 */
	public int productPay(Map<String, Object> productOrder) {
		
		return sqlSession.insert("productMapper.productPay", productOrder);
	}


	/** 장바구니 삽입을 위한 옵션 TB 삽입 (옵션 코드)
	 * @param string
	 * @return result
	 */
	public int insertOptionInfo(Map<String, Object> optionMap) {

		return sqlSession.insert("productMapper.insertOptionInfo", optionMap);
	}

	/** 장바구니 테이블 삽입
	 * @return insertProductCart
	 */
	public int insertProductCart() {

		return sqlSession.insert("productMapper.insertProductCart");
	}

	/** 옵션 No 조회
	 * @param cartOptionMap
	 * @return selectOptionNo
	 */
	public List<Integer> selectOptionNo(Map<String, Object> cartOptionMap) {

		return sqlSession.selectList("productMapper.selectOptionNo", cartOptionMap);
	}
}
