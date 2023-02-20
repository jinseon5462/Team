package org.green.seenema.admin.sales.controller;

import java.util.ArrayList;

import org.green.seenema.mapper.SalesMapper;
import org.green.seenema.vo.MovieVO;
import org.green.seenema.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminSalesController {
	
	@Autowired
	SalesMapper mapper;
	
	@GetMapping("/salesPage")
	public void salesPage(Model model) {
		ArrayList<MovieVO> mList = mapper.getMovieTopfive();
		ArrayList<ProductVO> pList = mapper.getProductTopfive();
		
		model.addAttribute("mList", mList);
		model.addAttribute("pList", pList);
		
	}
	
	@GetMapping("/test")
	public void test(Model model) {
		ArrayList<MovieVO> mList = mapper.getMovieTopfive();
		ArrayList<ProductVO> pList = mapper.getProductTopfive();
		
		model.addAttribute("mList", mList);
		model.addAttribute("pList", pList);
	}
}
