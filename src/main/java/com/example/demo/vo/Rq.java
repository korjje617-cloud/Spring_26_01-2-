package com.example.demo.vo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;

// 로그인 관련 전담 
public class Rq {

	@Getter
	private boolean isLogined;
	@Getter
	private int loginedMemberId;

	public Rq(HttpServletRequest req) {
		HttpSession httpSession = req.getSession();

		if (httpSession.getAttribute("loginedMemberId") != null) {
			isLogined = true;
			loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");
		}
	}
}