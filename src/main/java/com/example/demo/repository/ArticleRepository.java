package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Article;

@Mapper
public interface ArticleRepository {

	public int writeArticle(int memberId, String title, String body);

	public void deleteArticle(int id);

	public void modifyArticle(int id, String title, String body);

	public Article getArticleById(int id);

	public List<Article> getArticles(int boardId);
	// MyBatis와 Java 메서드를 연결

	public int getLastInsertId();
	
	public Article getForPrintArticle(int id);

}
