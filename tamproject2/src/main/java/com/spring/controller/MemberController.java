package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.MemberVO;
import com.spring.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
/*
 * @RequestMapping(value="/member/*", method= {RequestMethod.GET,
 * RequestMethod.POST})
 */
@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("list")
	public String list(Model model) {
		List<MemberVO> m_list = service.getList();
		model.addAttribute("m_list", m_list);
		return "/member/list";
	}
		

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void register() {
		log.info("회원가입 페이지 진입");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(MemberVO member) {
		log.info("register 진입");
		//회원 가입 서비스 실행
		service.regsiter(member);
		log.info("register service 성공");
		return "redirect:/member/list";
	}
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {
		log.info("로그인페이지 진입");
	}
	
	//아이디 중복 검사
	@RequestMapping(value="/memberIdChk", method=RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String userid) {
		//log.info("memberIdChk() 진입");
		log.info("memberIdChk() 진입");
		int result = service.idCheck(userid);
		log.info("결과값=" + result);
		if(result != 0) {
			return "fail"; 	//중복 아이디가 존재
		}else {
			return "success";	//중복 아이디x
		}
	}
	
	//로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) {
		//System.out.println("login 메서드 진입");
		//System.out.println("전달된 데이터 : " + member);
		
		HttpSession session = request.getSession();
		MemberVO lvo = service.memberLogin(member);
		
		if(lvo == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		}
		
		session.setAttribute("member", lvo);
		return "redirect:/index";
	}
	
	//로그아웃
	 @RequestMapping(value="logout.do", method=RequestMethod.GET)
	    public String logoutMainGET(HttpServletRequest request){
	        log.info("logoutMainGET메서드 진입");
	        HttpSession session = request.getSession();
	        session.invalidate();
	        return "redirect:/index";
	    }
	
	@GetMapping("/view") 
	public void view() { 
		log.info("view");
	}
	 
	/* 페이지 수정 */
	@GetMapping("/modify") 
	public void memberModifyGET(String userid, Model model) {
        
        model.addAttribute("member", service.get(userid));
        
    }
	
	
	@PostMapping("/modify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		service.modify(member);
		rttr.addAttribute("result", "modify success");
		
		return "redirect:/member/list";
	}
	
	/* 페이지 삭제 */
	@PostMapping("/remove")
	public String remove(MemberVO member) {
		log.info("remove 진입 성공");
		service.remove(member);
		log.info("remove 수정 성공");
		return "redirect:/member/list";
	}
	
	
}
