package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//@Getter, Setter, ToString,
//EqualsAndHashCode, RequiredArgsConstructor를
//한 번에 생성
@Data

//모든 필드를 파라미터로 받는 생성자를 생성
@AllArgsConstructor

//파라미터가 없는 기본 생성자를 생성
@NoArgsConstructor

//빌더 패턴을 자동 생성
@Builder
public class reactionPoint {
	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private String relTypeCode;
	private int relId;
	private int point;
}

/**
relTypeCode 정보는
게시글 컨트롤러에서 메서드로 받아간다
showDetail 부분 보면 메서드 인자로 보내주고 있음
댓글 좋아요도 그것처럼 하면 될까??
**/