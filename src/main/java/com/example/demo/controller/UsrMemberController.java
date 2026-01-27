package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

import jakarta.servlet.http.HttpSession;

@Controller
public class UsrMemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public ResultData doLogout(HttpSession session) {

		boolean isLogined = false;

		if (session.getAttribute("loginedMemberId") != null) {
			isLogined = true;
		}

		if (!isLogined) {
			return ResultData.from("F-A", "이미 로그아웃중");
		}

		session.removeAttribute("loginedMemberId");

		return ResultData.from("S-1", "로그아웃 됨");
	}

	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public ResultData<Member> doLogin(HttpSession session, String loginId, String loginPw) {

		boolean isLogined = false;

		if (session.getAttribute("loginedMemberId") != null) {
			isLogined = true;
		}

		if (isLogined) {
			return ResultData.from("F-A", "이미 로그인중");
		}

		if (Ut.isEmptyOrNull(loginId)) {
			return ResultData.from("F-1", "loginId 입력해");
		}
		if (Ut.isEmptyOrNull(loginPw)) {
			return ResultData.from("F-2", "loginPw 입력해");
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			return ResultData.from("F-3", Ut.f("%s는 없는 아이디", loginId));
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			return ResultData.from("F-4", "비밀번호 x");
		}

		session.setAttribute("loginedMemberId", member.getId());

		return ResultData.from("S-1", Ut.f("%s님 환영합니다", member.getNickname()), "이번에 로그인 한 회원", member);
	}

	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public ResultData<Member> doJoin(HttpSession session, String loginId, String loginPw, String name, String nickname,
			String cellphoneNum, String email) {

		boolean isLogined = false;

		if (session.getAttribute("loginedMemberId") != null) {
			isLogined = true;
		}

		if (isLogined) {
			return ResultData.from("F-A", "이미 로그인중");
		}

		if (Ut.isEmptyOrNull(loginId)) {
			return ResultData.from("F-1", "loginId 입력해");
		}
		if (Ut.isEmptyOrNull(loginPw)) {
			return ResultData.from("F-2", "loginPw 입력해");
		}
		if (Ut.isEmptyOrNull(name)) {
			return ResultData.from("F-3", "name 입력해");
		}
		if (Ut.isEmptyOrNull(nickname)) {
			return ResultData.from("F-4", "nickname 입력해");
		}
		if (Ut.isEmptyOrNull(cellphoneNum)) {
			return ResultData.from("F-5", "cellphoneNum 입력해");
		}
		if (Ut.isEmptyOrNull(email)) {
			return ResultData.from("F-6", "email 입력해");
		}

		ResultData doJoinRd = memberService.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);

		if (doJoinRd.isFail()) {
			return doJoinRd;
		}

		Member member = memberService.getMemberById((int) doJoinRd.getData1());

		return ResultData.newData(doJoinRd, "이번에 가입한 회원 / 새로 INSERT 된 member", member);
	}

}