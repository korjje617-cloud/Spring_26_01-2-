package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.BoardRepository;
import com.example.demo.vo.Board;

//이 클래스가 핵심 비즈니스 로직을 담당하는 '서비스' 객체임을 스프링에 알림
@Service
public class BoardService {

	// 스프링이 자동으로 BoardRepository 객체를 연결(주입)
	@Autowired
	private BoardRepository boardRepository;

	// 서비스 객체가 생성될 때 리포지토리를 넘겨받아 초기화
	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}

	// getBoardById: 게시판 번호를 전달받아 해당 게시판의 상세 정보를 가져오는 메서드
	public Board getBoardById(int boardId) {
		
		// 리포지토리에게 실제 DB 조회를 시키고 그 결과를 받아 반환
		return boardRepository.getBoardById(boardId);
	}

}