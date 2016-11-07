<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="./css/w3.css" type="text/css">

<body>
	<hr>
	<h3>Food Board</h3>
	<c:if test="${sessionScope.num != null }">
		<div class="w3-row ">
			<div class="w3-col w3-right w3-centered" style="width: 15%">
				<input type=button value="글쓰기" onclick="window.location='FoodWriteForm.do'">
			</div>
			<div class="w3-col w3-left w3-centered" style="width: 15%"><p></p></div>
			<div class="w3-rest"  align="center"><p></p></div>
		</div>
	</c:if>

	<div >
		<c:if test="${count==0}">
			<h3>게시판에 저장된 글이 없습니다.</h3>
		</c:if>

		<c:if test="${count>0}">
			<c:set var="Size" value="${pageSize}" />
			<div>
				<div class="w3-row w3-centered">
					<c:forEach var="list" items="${list}">
						<div class="w3-col" style="width: 33.33%">
							<table class="w3-table w3-striped w3-bordered w3-border w3-centered">
								<tr>
									<td colspan="2">No. ${number}
										<c:set	var="number" value="${number-1}" />
									</td>
								</tr>

								<tr>
									<td colspan="2">
										<a	href="FoodContent.do?num=${list.num}&pageNum=${currentPage}">
											<img src="${list.imagepath}" height="200">
										</a>
									</td>
								</tr>
							</table>
							<br>

							<table class="w3-table w3-striped w3-bordered w3-border w3-centered">
								<tr>
									<td>이름</td>
									<td>제목</td>
								</tr>
								<tr>
									<td>${list.writer}</td>
									<td>${list.subject}</td>
								</tr>
								<c:set var="Size" value="${Size-1}" />
							</table>
						</div>
					<c:if test="${Size<4}">
				</div>
				<div><p></p></div>
				<div class="w3-row w3-centered">
					<c:set var="Size" value="${pageSize}" />
		</c:if>
		</c:forEach>
	</div>
	</div>
</c:if>
		<div><p></p></div>



		<!-- 전체 페이지의 수를 연산 -->
		<div align="center" class=main-bottom>

			<c:if test="${count>0}" >
				<c:set var="pageCount" value="${count/pageSize+(count%pageSize==0?0:1)}" />
				<c:set var="startPage" value="${1}" />
				<c:set var="pageBlock" value="${5}" />
	
				<fmt:parseNumber var="result" value="${currentPage/pageBlock}" integerOnly="true" />
					
				<c:if test="${(currentPage%pageBlock)!=0}">
					<c:set var="startPage" value="${result*pageBlock+1}" />
				</c:if>
	
				<c:if test="${(currentPage%pageBlock)==0}">
					<c:set var="startPage" value="${(result-1)*pageBlock+1}" />
				</c:if>
				
				<c:set var="endPage" value="${startPage+pageBlock-1}" />
				<c:if test="${endPage>pageCount}">
					<c:set var="endPage" value="${pageCount}" />
				</c:if>				
				
				<ul class="w3-pagination w3-large">
					<c:if test="${startPage>5}">
						<li><a href="FoodList.do?pageNum=${startPage-5}" class="w3-hover-black">&laquo;</a></li>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li><a href="FoodList.do?pageNum=${i}" class="w3-hover-black">${i}</a></li>
					</c:forEach>

					<c:if test="${endPage<pageCount}">
						<li><a href="FoodList.do?pageNum=${startPage+5}" class="w3-hover-black">&raquo;</a></li>
						
					</c:if>
				</ul>
				<br>
			</c:if>
		</div>		
		<!-- 전체 페이지의 수를 연산 End -->
	</div>
</body>
</html>