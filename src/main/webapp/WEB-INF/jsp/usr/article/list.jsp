<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.code } LIST"></c:set>

<%@ include file="../common/head.jspf"%>

<hr />

<%-- <div>${board }</div> --%>

<!-- jsp 는 정보를 받았고 -->
<section class="mt-24 text-xl px-4">
	<div class="mx-auto">
		<!-- 여기서 바로 게시글 갯수 활용 -->
		<div>${articlesCount }개</div>
		<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">

			<thead>
				<tr>
					<th style="text-align: center;">ID</th>
					<th style="text-align: center;">Registration date</th>
					<th style="text-align: center;">Title</th>
					<th style="text-align: center;">Writer</th>
				</tr>
			</thead>

			<!-- 모델 객체에 있는 정보 가져다가 가공해서 쓰고있고 -->
			<tbody>
				<c:forEach var="article" items="${articles }">
					<tr class="hover:bg-base-300">
						<td style="text-align: center;">${article.id }</td>
						<td style="text-align: center;">${article.regDate.substring(0,10) }</td>
						<td style="text-align: center;">
							<a href="detail?id=${article.id } ">${article.title }</a>
						</td>
						<td style="text-align: center;">${article.extra__writer }</td>
					</tr>
				</c:forEach>

				<!-- 여기서 게시글이 없다면? 이 문구가 나온다 -->
				<c:if test="${empty articles }">
					<tr>
						<td colspan="4" style="text-align: center;">게시글이 없습니다</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</section>

<!-- 여기가 페이지네이션 구간 -->
<!-- 뷰포트 가운데에 정렬했고 -->
<div class="flex justify-center m-4">

	<!-- JSTL 의 forEach 반복문 제어 문법을 보면 var 변수의 값 i가 증가할거고 -->
	<!-- 시작은 1 끝은 토탈페이지 숫자만큼 -->
	<c:forEach var="i" begin="1" end="${totalPages}">
		<!-- a 링크가 바로 나오면 너무 숫자끼리 붙어있어서 div로 감싸주고 마진 넣어줬음 -->
		<div class="m-2 " border="1" cellspacing="0" cellpadding="5">
			<!-- a링크로 값이 대입되어 이동할 수 있다 -->
			<a href="list?boardId=${board.id}&page=${i}"> ${i} </a>
		</div>
	</c:forEach>
</div>

<%@ include file="../common/foot.jspf"%>