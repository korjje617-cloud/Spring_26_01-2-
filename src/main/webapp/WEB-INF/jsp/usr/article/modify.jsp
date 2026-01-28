<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE MODIFY"></c:set>

<%@ include file="../common/head.jspf"%>

<hr />

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../article/doModify" method="POST">
			<table border="1" cellspacing="0" cellpadding="5" style="width: 50%; border-collapse: collapse;">
				<tbody>

					<tr>
						<th>제목</th>
						<td>
							<input size=50 maxlength=50 style="border: 1px solid black;" name="title" autocomplete="off" type="text"
								value="${article.title}" />
						</td>
					</tr>



					<tr>
						<th>본문</th>
						<td>
							<textarea rows="20" cols="50" style="border: 1px solid black;" name="body" autocomplete="off">${article.body}</textarea>
						</td>
					</tr>

					<tr>
						<th></th>
						<td style="text-align: right;">
							<input type="submit" value="수정" />
						</td>
					</tr>


				</tbody>
			</table>
		</form>
		<div class="btns">
			<button type="button" onClick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>