<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE WRITE"></c:set>

<%@ include file="../common/head.jspf"%>

<hr />

<section class="mt-24  text-xl px-4">
	<div class="mx-auto">
		<form action="../article/doWrite" method="POST">
			<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
				<tbody>

					<tr>
						<th style="text-align: center;">게시판</th>
						<td style="text-align: center;">
							<select name="boardId">
								<option value="" selected disabled>게시판을 선택해주세요</option>
								<option value="1">공지</option>
								<option value="2">자유</option>
								<option value="3">QnA</option>
							</select>
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">Title</th>
						<td style="text-align: center;">
							<input class="input input-neutral input-sm" name="title" type="text" autocomplete="off" placeholder="제목" />
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">Body</th>
						<td style="text-align: center;">
							<input class="input input-neutral input-sm" name="body" type="text" autocomplete="off" placeholder="내용" />
						</td>
					</tr>
					<tr>
						<th></th>
						<td style="text-align: center;">
							<input class="btn btn-outline btn-ghost" type="submit" value="작성" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-outline btn-ghost" type="button" type="button" onClick="history.back();">뒤로가기</button>

		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>