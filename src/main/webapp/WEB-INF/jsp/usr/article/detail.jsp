<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>

<%@ include file="../common/head.jspf"%>

<hr />

<!-- <iframe src="http://localhost:8080/usr/article/doIncreaseHitCount?id=2" frameborder="0"></iframe> -->

<script>
	const params = {};
	params.id = parseInt('${param.id}');
</script>

<script>
	function ArticleDetail__doIncreaseHitCount() {
		$.get('../article/doIncreaseHitCountRd', {
			id : params.id,
			ajaxMode : 'Y'
		}, function(data) {
			$('.article-dtail__hit-count').html(data.data1);
			console.log(data);
			console.log('data.msg : ' + data.msg);
			console.log('data.data1 : ' + data.data1);
		}, 'json')
	}

	$(function() {
		ArticleDetail__doIncreaseHitCount();
		// 		setTimeout(ArticleDetail__doIncreaseHitCount, 2000);
	})
</script>

<section class="mt-24 text-xl px-4">
	<div class="mx-auto">
		<div class="article-detail" style="width: 800px; margin: 0 auto;">

			<!-- 제목 -->
			<h2 style="margin-bottom: 10px;">${article.title}</h2>

			<!-- 메타 정보 -->
			<div style="color: #666; font-size: 14px; margin-bottom: 20px;">

				<span>작성자: ${article.extra__writer }</span>

				&nbsp;|&nbsp;

				<span>작성일: ${article.regDate }</span>

				&nbsp;|&nbsp;

				<span>조회수: ${article.hitCount }</span>

				<div style="text-align: right; font-size: 12px; color: #999;">게시글 번호: ${article.id}</div>

			</div>

			<hr>

			<!-- 본문 -->
			<div style="min-height: 200px; padding: 20px 0; font-size: 16px; line-height: 1.6; white-space: pre-line;">${article.body}</div>

			<hr>

			<!-- 좋아요 싫어요 합계 -->
			<tbody>
				<tr>
					<th style="text-align: center;">LIKE</th>
					<td style="text-align: center;">${article.extra__goodReactionPoint }</td>
				</tr>
				<tr>
					<th style="text-align: center;">DISLIKE</th>
					<td style="text-align: center;">${article.extra__badReactionPoint }</td>
				</tr>
				<tr>
					<th style="text-align: center;">SUM</th>
					<td style="text-align: center;">${article.extra__sumReactionPoint }</td>
				</tr>
			</tbody>


			<!-- 하단 정보 -->

			<div class="btns mt-10">
				<button class="btn btn-outline btn-ghost" type="button" onClick="history.back();">뒤로가기</button>
				<c:if test="${article.userCanModify }">
					<a class="btn btn-outline btn-warning" type="button" href="../article/modify?id=${article.id }">수정</a>
				</c:if>
				<c:if test="${article.userCanDelete }">
					<a class="btn btn-outline btn-error" type="button" href="../article/doDelete?id=${article.id }">삭제</a>
				</c:if>

			</div>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>