package com.example.demo.vo;

import java.time.LocalDateTime;

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
public class Board {

	private int id;
	private String regDate;
	private String updateDate;
	private String code;
	private String name;
	private boolean delStatus;
	private LocalDateTime delDate;
}