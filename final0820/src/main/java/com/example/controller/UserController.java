package com.example.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.example.domain.UserVO;
import com.example.mapper.UserMapper;
import com.example.service.CertificationService;
import com.example.service.IdSearchService;
import com.example.service.KakaoService;
import com.example.service.PwSearchService;
import com.example.service.UserMailSendService;

@Controller
public class UserController {
	
	@Autowired
	private CertificationService certificationService;
	
	@Autowired
	private IdSearchService searchService;
	
	@Autowired
	private UserMailSendService mailsender;
	
	@Autowired
	private PwSearchService pwSearchService;
	
   @Autowired
   UserMapper mapper;
   
   @Autowired
   KakaoService kakao;

   @Autowired
   BCryptPasswordEncoder passEncoder;
   
   @RequestMapping("/user/insert2")
   public void insert2() {
   }
   
   @RequestMapping("/user/terms")
   public void terms() {
   }
   
   @RequestMapping("/check/sendSMS")
   @ResponseBody
   public String sendSMS(String phoneNumber) {
       Random rand  = new Random();
       String numStr = "";
       for(int i=0; i<4; i++) {
           String ran = Integer.toString(rand.nextInt(10));
           numStr+=ran;
       }
       System.out.println("수신자 번호 : " + phoneNumber);
       System.out.println("인증번호 : " + numStr);
       certificationService.certifiedPhoneNumber(phoneNumber,numStr);
       return numStr;
   }
   
   // 비밀번호 찾기
	@RequestMapping(value = "/user/searchPassword", method = RequestMethod.GET)
	@ResponseBody
	public String passwordSearch(@RequestParam("id")String id,
			@RequestParam("email")String email,
			HttpServletRequest request) {
		System.out.println(id);
		pwSearchService.mailSendWithPassword(id, email, request);
		return "user/userSearchPassword";
	}
   
   // 아이디 찾기
	@RequestMapping(value = "/user/userSearch", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(@RequestParam("inputName_1") String name, 
			@RequestParam("inputTel_1") String tel) {
		String result = searchService.get_searchId(name, tel);
		return result;
	}
   
	@RequestMapping("/user/modal")
	public void modal() {
	}
	
   @RequestMapping("/user/userSearch")
   public void userSearch() {
   }

   @RequestMapping("/user/regSuccess")
   public void regSuccess() {
   }
   
	//e-mail 인증 컨트롤러
	@RequestMapping(value = "/user/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("id") String id, @RequestParam("user_key") String key) {
		mailsender.alter_userKey_service(id, key); // mailsender의 경우 @Autowired
		return "/user/regSuccess";
	}
	
   @RequestMapping("/user/loginNaverResult")
   public String loginNaverResult(String email, HttpSession session){
      session.setAttribute("id", email);
      return "redirect:/index";
   }
   
   @RequestMapping("/user/loginNaver")
   public void loginNaver(){
   }
   
   @RequestMapping("/user/readPassword")
   public void readPassword() {

   }
   
   @RequestMapping("/user/deletePassword")
   public void deletePassword() {

   }
   
   @RequestMapping("/user/myPage")
   public void myPage(Model model, String id) {
      model.addAttribute("vo", mapper.read(id));
   }
   
   @RequestMapping("/user/addressAPI")
   public void addressAPI() {

   }

   @RequestMapping("/user/login")
   public void login() {

   }

   @RequestMapping("/user/insert")
   public void insert() {
   }

   @RequestMapping("/user/readPasswordCheck")
   @ResponseBody
   public int readPasswordCheck(UserVO vo) {
      int result = 0;
      UserVO readVO=mapper.read(vo.getId());
      if (passEncoder.matches(vo.getPassword(), readVO.getPassword())){
         result=1;
      }
      return result;
   }
   
   @RequestMapping("/user/deletePasswordCheck")
   @ResponseBody
   public int deletePasswordCheck(UserVO vo) {
      int result = 0;
      UserVO readVO=mapper.read(vo.getId());
      if (passEncoder.matches(vo.getPassword(), readVO.getPassword())){
         result=1;
      }
      return result;
   }
   
   @RequestMapping("/user/read")
   public void read(Model model, String id) {
      model.addAttribute("vo", mapper.read(id));
   }

   @RequestMapping(value = "/user/insert", method = RequestMethod.POST)
   public void insertPost(UserVO vo, HttpServletRequest request) {
      String inpassword = vo.getPassword();
      String password = passEncoder.encode(inpassword);
      vo.setPassword(password);
      mapper.insert(vo);

	  // 인증 메일 보내기 메서드
	  mailsender.mailSendWithUserKey(vo.getEmail(), vo.getId(), request);
   }

   @RequestMapping(value = "/user/update", method = RequestMethod.POST)
   public String updatePost(UserVO vo, HttpSession session) {
      vo.setPassword(passEncoder.encode(vo.getPassword()));
      mapper.update(vo);
      session.invalidate();
      return "redirect:/index";
   }

   @RequestMapping("/user/oauth")
   public String snsLogin(@RequestParam("code") String code, HttpSession session) {
      String access_Token = kakao.getAccessToken(code);
      HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
      System.out.println("login Controller : " + userInfo);
      // 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
      if (userInfo.get("id") != null) {
         session.setAttribute("id", userInfo.get("id"));
         session.setAttribute("name", userInfo.get("name"));
         session.setAttribute("tel", userInfo.get("tel"));
         session.setAttribute("birthday", userInfo.get("birthday"));
         session.setAttribute("access_Token", access_Token);
      }
      return "redirect:/index";
   }

   @RequestMapping("/user/logout")
   public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response)
         throws Exception {
      response.setContentType("text/html; charset=utf-8");
      kakao.kakaoLogout((String) session.getAttribute("access_Token"));

      session.removeAttribute("access_Token");
      session.removeAttribute("id");
      session.removeAttribute("name");
      session.invalidate();

      Cookie Idcookie = WebUtils.getCookie(request, "id");
      if (Idcookie != null) {
         Idcookie.setPath("/");
         Idcookie.setMaxAge(0);
         response.addCookie(Idcookie);
      }
      Cookie Namecookie = WebUtils.getCookie(request, "name");
      if (Namecookie != null) {
         Namecookie.setPath("/");
         Namecookie.setMaxAge(0);
         response.addCookie(Namecookie);
      }
      return "redirect:/index";
   }

   @RequestMapping(value = "/user/login", method = RequestMethod.POST)
   @ResponseBody
   public int loginPost(UserVO vo, boolean chkLogin, HttpSession session, HttpServletResponse response) throws UnsupportedEncodingException{
      int result = 0;
      UserVO readVO = mapper.read(vo.getId());
      if (readVO.getPosition().equals("2")) {
   		 result = 5;
   	  }else if (readVO != null) { // 아이디가 존재하는 경우
   		  if (readVO.getActiveStatus().equals("0")) {
   			  if (passEncoder.matches(vo.getPassword(), readVO.getPassword())) {
		          //user_key가 Y인경우 (메일인증을 하면 Y로 컬럼값이 변경)
   				  if (readVO.getUser_key().equals("Y")) {
   					  result = 2;
		              session.setAttribute("id", vo.getId());
		              session.setAttribute("name", readVO.getName());
		              if (chkLogin) {
		            	  Cookie Idcookie = new Cookie("id", vo.getId());
		            	  Cookie Namecookie = new Cookie("name",URLEncoder.encode(readVO.getName(), "UTF-8"));
		            	  Idcookie.setPath("/");
		                  Idcookie.setMaxAge(10000);
		                  response.addCookie(Idcookie);
		                  Namecookie.setPath("/");
		                  Namecookie.setMaxAge(10000);
		                  response.addCookie(Namecookie);
		              }
   				  }else {
   					  result = 4;
		          }
   			  } else {
   				  result = 1;
		      }
   		  } else {
   			  result = 3;
          }       
   	  }
      return result;
   }

   @RequestMapping(value = "/user/login2", method = RequestMethod.POST)
   @ResponseBody
   public int loginPost2(UserVO vo) {
      int result = 0;
      UserVO readVO = mapper.read(vo.getId());
      if (readVO != null) { // 아이디가 존재하는 경우
         result = 1;
      }
      return result;
   }

   @RequestMapping(value = "/user/delete", method = RequestMethod.POST)
   @ResponseBody
   public String deletePost(String id,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
      mapper.delete(id);
      session.removeAttribute("id");
      session.invalidate();

      Cookie cookie = WebUtils.getCookie(request, "id");
      if (cookie != null) {
         cookie.setPath("/");
         cookie.setMaxAge(0);
         response.addCookie(cookie);

      }
      return "redirect:/index";
   }
}