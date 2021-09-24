package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.domain.Criteria;
import com.team.domain.MemberVO;
import com.team.domain.PageDTO;
import com.team.domain.ProductVO;
import com.team.service.AttachService;
import com.team.service.ProductService;
import com.team.util.Script;

@Controller
@RequestMapping("/products/*")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AttachService attachService;
	
	
	@GetMapping("/productsList") //��ǰ��ȸ���� GetMapping 
	public String products(Criteria cri, Model model) {
		System.out.println("productsList 호출...");
		List<ProductVO> proList = productService.getProducts(cri);
		
		int totalCount = productService.getTotalCount();
		
		PageDTO pageDTO = new PageDTO(totalCount, cri);//페이지 블록 화면 만들때 필요한 정보
		
		
		model.addAttribute("proList", proList);
		model.addAttribute("pageMaker", pageDTO);
		return "products/productsList_";
	}
	
	@PostMapping("/products") //��ǰ��ȸ���� PostMapping
	public ResponseEntity<String> products(MemberVO memberVO){
		
		String str = Script.href("��ǰ���!", "/products/productsList");
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	}
}
