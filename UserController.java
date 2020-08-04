package com.example.controller;

import java.util.HashMap;

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
import com.example.service.KakaoService;

@Controller
public class UserController {
	@Autowired
	UserMapper mapper;
	
	@Autowired
	KakaoService kakao;

	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@RequestMapping("/user/loginNaverResult")
	public String loginNaverResult(String email, HttpSession session){
	 session.setAttribute("id", email);
	 return "redirect:/index";
	}
	
	@RequestMapping("/user/loginNaver")
	public void loginNaver(){
	}
	
	@RequestMapping("/user/myPage")
	public void myPage(Model model, String id) {
		model.addAttribute("vo",mapper.read(id));
	}
	
	@RequestMapping("/user/addressAPI")
	public void addressAPI() {

	}

	@RequestMapping("/user/login")
	public String login() {
		return "/user/login";
	}

	@RequestMapping("/user/insert")
	public void insert() {

	}

	@RequestMapping("/user/read")
	public void read(Model model, String id) {
		model.addAttribute("vo", mapper.read("1"));
	}

	@RequestMapping(value = "/user/insert", method = RequestMethod.POST)
	public void insertPost(UserVO vo) {
		String inpassword = vo.getPassword();
		String password = passEncoder.encode(inpassword);
		vo.setPassword(password);
		mapper.insert(vo);
	}

	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	public String updatePost(UserVO vo) {
		System.out.println(vo.toString());
		vo.setPassword(passEncoder.encode(vo.getPassword()));
		mapper.update(vo);
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
		session.invalidate();

		Cookie cookie = WebUtils.getCookie(request, "id");
		if (cookie != null) {
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		return "redirect:/index";
	}

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	@ResponseBody
	public int loginPost(UserVO vo, boolean chkLogin, HttpSession session, HttpServletResponse response) {
		int result = 0;
		UserVO readVO = mapper.read(vo.getId());
		if (readVO.getActiveStatus().equals("0")) {
			if (readVO != null) { // 아이디가 존재하는 경우
				if (passEncoder.matches(vo.getPassword(), readVO.getPassword())) {
					result = 2;
					session.setAttribute("id", vo.getId());
					if (chkLogin) {
						Cookie cookie = new Cookie("id", vo.getId());
						cookie.setPath("/");
						cookie.setMaxAge(1000);
						response.addCookie(cookie);
					}
				} else {
					result = 1;
				}
			}
		} else {
			result = 3;
		}
		return result;
	}

	@RequestMapping(value = "/user/login2", method = RequestMethod.POST)
	@ResponseBody
	public int loginPost2(UserVO vo, boolean chkLogin, HttpSession session, HttpServletResponse response) {
		System.out.println(chkLogin);
		int result = 0;
		UserVO readVO = mapper.read(vo.getId());
		if (readVO != null) { // 아이디가 존재하는 경우
			result = 1;
		}
		return result;
	}

	@RequestMapping(value = "/user/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deletePost(String id) {
		mapper.delete(id);
		return "redirect:/index";
	}
}
