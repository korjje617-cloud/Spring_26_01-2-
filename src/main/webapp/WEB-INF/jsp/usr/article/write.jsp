<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE WRITE"></c:set>

<%@ include file="../common/head.jspf"%>

<hr />

<section class="mt-8 text-xl px-4">
	<div class="mx-auto flex justify-center">
		<form action="../article/doModify" method="POST">
			<table border="1" cellspacing="0" cellpadding="5" style="width: 50%; border-collapse: collapse;">
				<tbody>
				
					<input type="hidden" name="id" value="${article.id}">

					<tr>
						<th nowrap>제목</th>
						<td>
							<input size=50 maxlength=50 style="border: 1px solid black;" name="title" autocomplete="off" type="text"
								value="제목" />
						</td>
					</tr>

					<tr>
						<th nowrap>본문</th>
						<td>
							<textarea rows="20" cols="50" style="border: 1px solid black;" name="body" autocomplete="off" value="본문"></textarea>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<button type="button" onclick="history.back();">뒤로가기</button>
						</td>

						<td style="text-align: right;" nowrap>
							<button type="submit">작성</button>
						</td>
					</tr>

				</tbody>
			</table>
		</form>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>