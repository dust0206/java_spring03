package com.example.spring03;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller		// 콘트롤러 빈
public class MemoController {
	
	@Inject
	MemoDAO memoDao;
	
	@RequestMapping("/")	// 시작
	public ModelAndView list(ModelAndView mav) {
		List<MemoDTO> items = memoDao.list();
		mav.setViewName("list");	// view/list.jsp
		mav.addObject("list", items);	// list 변수명에닥 items 데이타를 넣는다
		return mav;
	}
	
	@RequestMapping("insert.do")
	public String insert(MemoDTO dto) {
		memoDao.insert(dto.getWriter(), dto.getMemo());
		return "redirect:/";
	}
	
	@RequestMapping("view/{idx}")
	public ModelAndView view(@PathVariable int idx, ModelAndView mav ) {
		mav.setViewName("view");
		mav.addObject("dto", memoDao.view(idx));
		return mav;
	}
	
	@RequestMapping("update/{idx}")
	public String update(@PathVariable int dix, MemoDTO dto) {
		memoDao.update(dto);
		return "redirect:/";
	}
	
	@RequestMapping("delete/{idx}")
	public String delete(@PathVariable int idx) {
		memoDao.delete(idx);
		return "redirect:/";
	}
}
