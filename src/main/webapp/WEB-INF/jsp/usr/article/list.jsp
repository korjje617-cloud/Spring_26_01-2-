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
	
	<!-- 페이지로 이동하는 버튼들을 그룹으로 묶는다 데이지ui 기능임 -->
	<div class="btn-group join">

		<!-- JSTL 의 forEach 반복문 제어 문법을 보면 var 변수의 값 i가 증가할거고 -->
		<!-- for (int i = 1; i <= totalPages; i++) -->
		<c:forEach var="i" begin="1" end="${totalPages}">

			<!-- a링크로 값이 대입되어 이동할 수 있다 -->
			<a href="list?boardId=${board.id}&page=${i}" class="join-item btn btn-sm ${param.page == i ? 'btn-active' : ''}"> ${i} </a>

		</c:forEach>

	</div>
</div>

<%@ include file="../common/foot.jspf"%>