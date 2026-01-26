package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;

@Service
public class ArticleService {

	@Autowired
	private ArticleRepository articleRepository;

	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
//		makeTestData();
	}

	// 서비스메서드
//	private void makeTestData() {
//		for (int i = 1; i <= 10; i++) {
//			String title = "제목 " + i;
//			String body = "내용 " + i;
//
//			articleRepository.writeArticle(title, body);
//		}
//	}

	public ResultData writeArticle(int loginedMemberId, String title, String body) {

		articleRepository.writeArticle(loginedMemberId, title, body);

		int id = articleRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 게시글 작성", id), "이번에 쓰여진 글의 id", id);
	}

	public ResultData loginedMemberCanModify(int loginedMemberId, Article article) {

		if (article.getMemberId() != loginedMemberId) {
			return ResultData.from("F-A2", Ut.f("%d번 게시글에 대한 권한 없음", article.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 게시글을 수정", article.getId()));
	}

	public void deleteArticle(int id) {
		articleRepository.deleteArticle(id);
	}

	public void modifyArticle(int id, String title, String body) {
		articleRepository.modifyArticle(id, title, body);

	}

	public Article getArticleById(int id) {
		return articleRepository.getArticleById(id);
	}

	public List<Article> getArticles() {
		return articleRepository.getArticles();
	}

}
