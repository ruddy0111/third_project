package com.koreait.nemorecipe.controller.client;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.nemorecipe.domain.Member;
import com.koreait.nemorecipe.domain.Recipe;
import com.koreait.nemorecipe.exception.MemberExistException;
import com.koreait.nemorecipe.model.common.file.FileManager;
import com.koreait.nemorecipe.model.service.member.MemberService;
import com.koreait.nemorecipe.model.service.recipe.RecipeService;

@Controller
public class ClientController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private RecipeService recipeService;
	
	@Autowired
	private FileManager fileManager;
	
	Member obj;
	
	//메인화면 요청처리
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainForm(HttpServletRequest request) {
		return "client/main";
	}
	
	//글 목록 요청처리
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) {
		//3단계: 일 시키기
		List recipeList = recipeService.selectAll();
		
		//4단계: 결과 저장
		model.addAttribute("recipeList", recipeList);
		
		return "client/recipe_list";
	}
	
	//글작성화면 요청처리
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public String registForm(HttpServletRequest request) {
		return "client/regist";
	}
	
	//글상세화면 요청처리
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detailForm(HttpServletRequest request) {
		return "client/detail";
	}
	
	//랭킹 화면 요청처리
	@RequestMapping(value="/ranking", method=RequestMethod.GET)
	public String rankingForm(HttpServletRequest request) {
		return "client/ranking";
	}
	
	//회원가입 폼 요청처리
	@RequestMapping(value="/signin", method=RequestMethod.GET)
	public String signin(HttpServletRequest request) {
		return "client/signin";
	}
	
	//로그인 폼 요청처리
	@RequestMapping(value="/loginform", method=RequestMethod.GET)
	public String loginform(HttpServletRequest request) {
		return "client/loginform";
	}
	
	//로그인 요청처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member member, HttpServletRequest request) {
		logger.info("아이디는 {} ",member.getUser_id());
		logger.info("비밀번호는 {} ",member.getUser_pass());
		
		//3단계: 일 시키기
		obj = memberService.login(member);
		logger.info("닉네임은 {} ",obj.getUser_nickname());
		
		//4단계: 결과 저장
		HttpSession session = request.getSession();
		session.setAttribute("member", obj); //request가 아닌 session에 저장함
		
		return "redirect:/client/main";
	}
	
	//로그아웃 요청처리
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		
		//3단계: 일 시키기
		
		//4단계: 결과 저장
		HttpSession session = request.getSession();
		session.setAttribute("member", null); //request가 아닌 session에 저장함
		
		return "redirect:/client/main";
	}
	
	//회원가입 요청 처리
	@PostMapping("/signup")
	public String singup(Member member, HttpServletRequest request) {
		//3단계: 일 시키기
		memberService.regist(member);
		
		return "redirect:/client/loginform";
	}
	
	//레시피 등록
    @RequestMapping(value = "/regist_recipe", method = RequestMethod.POST)
    public String registRecipe(Recipe recipe, HttpServletRequest request) {

        recipe.setMember_id(obj.getMember_id()); //멤버 id 넣기(포린키)
        
        String filename;

        MultipartFile photo=recipe.getPhoto();

        if(photo.isEmpty()) {
        	filename = "none";
        }else {
        	ServletContext context = request.getServletContext();
        	long time=System.currentTimeMillis();
        	filename=time+"."+fileManager.getExt(photo.getOriginalFilename());
        	fileManager.saveFile(context, filename , photo);
        }
        
        recipe.setRecipe_img(filename); //insert 직전에 파일명 결정짓기

        recipeService.regist(recipe);

        return "redirect:/client/list";
    }
	
}
