package com.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.domain.Criteria;
import com.team.domain.ProductVO;
import com.team.mapper.AttachMapper;
import com.team.mapper.ProductMapper;

@Service
public class ProductService {
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private AttachMapper attachMapper;
	
	public int register(ProductVO productVO) {
		return productMapper.insert(productVO);
	}
	
	public List<ProductVO> getProducts(){
		return productMapper.getProducts();
	}
	public ProductVO getProduct(int pnum){
		return productMapper.getProduct(pnum);
	}

	
	// 페이징으로 글 가져오기
	public List<ProductVO> getProducts(Criteria cri){
		
		int startRow = (cri.getPageNum() - 1) * cri.getAmount();
		cri.setStartRow(startRow); // 시작행번호 설정
		
		return productMapper.getProductsWithPaging(cri);
	}
	
	public int getTotalCount() {
		return productMapper.getTotalCount();
	}
	
	public int getTotalCountBySearch(Criteria cri) {
		return productMapper.getTotalCountBySearch(cri);
	}
	
	public ProductVO getBoardAndAttaches(int pnum) {

		
		return productMapper.getBoardAndAttaches(pnum); // join 쿼리로 데이터 가져오기
	}
	
}