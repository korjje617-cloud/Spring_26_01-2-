package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Article {

	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private int boardId;
	private String title;
	private String body;
	private int hitCount;
	// 좋아요 싫어요 추가
	private int likeCount;
	private int dislikeCount;

	private String extra__writer;
	private boolean userCanModify;
	private boolean userCanDelete;
}