package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.PageDTO;
import com.spring.service.BoardService;
import com.spring.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor 	//생성자를 만들고 자동으로 주입
public class BoardController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private ReplyService replyService;

	
	@GetMapping("/register")
	public void registerGET() {

	}
	/**
	 *글 목록 보기 
	 *기존 BoardController의 list()는 아무런 파라미터 없이 처리되었기 때문애 pageNum과 amount를 처리하기 위해 수정
	 */
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		//Criteria 클래스를 만들어 두면 편하게 하나의 타입만으로 파라미터나 리턴 타입을 사용 할 수 있어 편리함
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));

		int total = service.getTotal(cri);

		log.info("total: " + total);
		//list()는 "pageMaker"라는 이름으로 PageDTO클래스에서 객체를 만들어서 Model에 담아줌
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	//글 등록 
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {//RedirectAttributes를 파라미터로 지정 -> 등록 작업이 끝난 후 다시 목록 화면으로 이동하기 위함 
		//추가적으로 새롭게 등록된 게시글의 번호를 같이 전달하기 위해서 RedirectAttributes를 이용 
		log.info("register: " + board);

		service.register(board);

		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/board/list";	//'redirect:' 스프링MVC가 내부적으로 response.sendRedirect()처리해 주기 때문에 편리 
	}

	//글 조회 및 수정  
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {//게시물 번호(bno)가 출력 - 모든 데이터가 읽기 전용으로 처리

		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}

	//글 수정 
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {//RedirectAttributes 은 URL 뒤에 원래의 페이지로 이동하기 위해서 pageNum과 amount 값을 가지고 이동
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board/list";
	}

	
	//글 삭제 
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board/list";
	}
	

	//게시글 상세 보기, 댓글 목록
	/*@PreAuthorize("isAuthenticated()")
	@RequestMapping("/boardView")
	public String getBoard(int bno, @ModelAttribute("cri") Criteria cri, Model model) {
		service.getTotal(cri);
		
	}*/
	
}
