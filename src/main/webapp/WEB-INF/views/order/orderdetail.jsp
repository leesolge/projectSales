<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<script type="text/javascript">
	function morders(pn){
		var jumping = document.mord;
		jumping.orderid.value=pn;
		jumping.submit();
	}
	function dorders(pn){
		if (confirm("해당 수주를 정말 취소하시겠습니까?") == true){
			var jumping = document.dord;
			jumping.orderid.value=pn;
			jumping.submit();
		}else{
		    return;
		}
	}
	function corders(pn){
		if (confirm("해당 판매 요청을 정말 승인하시겠습니까?") == true){
			var jumping = document.cord;
			jumping.orderid.value=pn;
			jumping.submit();
		}else{
		    return;
		}
	}
	function jump(pc){
		var j = document.lists;
		j.checks.value=pc
		j.submit();
	}
	function worders(){
		var jumping = document.write;
		jumping.submit();
	}
</script>
<script type="text/javascript">
	$(document).ready(
		function() {
			var num = 1;
			$('#btn_AddO')	.click(
					function() {
						var num_ref = num;
						$('<tr class="O' + num_ref + '"><td id="O' + num_ref + '"><select class="w3-select w3-border w3-round-large" name="Ocode_'+num_ref+'" required="required">'+
								'<option value="" selected disabled>상품명</option>'+
								'<c:forEach var="list" items="${list}">'+
								'<option value="${list.procode}">${list.proname}</option>'+ 
								'</c:forEach></select></td></tr>'
						).appendTo('.order_list');
						
						$('<td id="O' + num_ref + '"><input class="w3-input w3-border w3-round-large" type="number" name="Oamount_'+num_ref+'" required="required"></td>').appendTo('.O'+num_ref);
						$('<td id="O' + num_ref + '"><input class="w3-input w3-border w3-round-large" type="text" name="Ocomment_' +num+ '" required="required"></td>').appendTo('.O'+num_ref);
						$('<td id="O' + num_ref + '"><a id="btn_DelO'+num_ref+'" class="w3-hover-text-red"><i class="fa fa-trash-o w3-xlarge"></i></a></td>').appendTo('.O'+num_ref);
				
						$('#btn_DelO'+num_ref).click(function() {
							$('.O'+num_ref).remove();
							$('#O'+num_ref).remove();
							});
						
						num++;
						});				
			});
</script>
<script>
	function myFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
</script>
	<head>
		<title>Title</title>
	</head>
	<body><br>
	<form name="mord" action="/erp/order/modifyForm" method="post">
		<input name="orderid" type="hidden" value="0">
		<input name="authpage" type="hidden" value="${authpage}">
	</form>
	<form name="dord" action="/erp/order/delete" method="post">
		<input name="orderid" type="hidden" value="0">
		<input name="authpage" type="hidden" value="${authpage}">
	</form>
	<form name="cord" action="/erp/order/cancle" method="post">
		<input name="orderid" type="hidden" value="0">
		<input name="authpage" type="hidden" value="${authpage}">
	</form>
	<form name="write" action="/erp/order/registForm" method="post">
		<input name="authpage" type="hidden" value="${authpage}">
	</form>
	<form name="lists" action="/erp/order/list" method="post">
		<input name="authpage" type="hidden" value="${authpage}">
		<input name="checks" type="hidden" value="0">
	</form>
<div class="w3-container">
	<div class="w3-row-padding w3-margin-bottom">
		<div class="w3-half">
			<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding" style="height:500px; overflow: auto;">
				<h3><i class="fa fa-inbox"></i>  상품정보</h3>
				<div class="w3-container" style="height: 40px;">
					물품명 : 
					<input class="w3-border w3-border-indigo" type="text" placeholder="검색어" id="myInput" onkeyup="myFunction()">
				</div>
				<br>
				<div class=" w3-row" style="height: 450px; overflow: auto;">
					<table class="w3-table w3-small w3-hoverable w3-bordered" id="myTable">
						<tr class="w3-indigo">
							<th>상품명</th>
							<th style="width: 50px;">재고</th>
							<th>원가</th>
						</tr>

						<c:forEach items="${productlist}" var="list">
							<tr
								onclick="location.href='/erp/product/productInfo?procode=${list.procode}'"
								style="cursor: pointer;">
								<td>${list.proname}</td>
								<td>${list.proamount}</td>
								<td style="text-align: right;"><fmt:formatNumber value="${list.originprice}" pattern="#,###" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="w3-hide-large w3-hide-medium"><br></div>
		</div>
		<div class="w3-half">
			<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding"  style="height:500px; overflow: auto;">
				<h3><i class="fa fa-info"></i>  판매정보</h3><br>
				<div class="w3-container w3-indigo">
					<h5><i class="fa fa-user-o"></i>  판매자</h5>
				</div>
				<div class="w3-card-2 w3-white w3-padding">
					<table class="w3-small">
						<tr>
							<td style="text-align: left;">
								<label class="w3-text-indigo">
								<b>- 소속</b>
								</label> :
								${ovo.team}
							</td>
						</tr>
						<tr>
							<td style="text-align: left;">
								<label class="w3-text-indigo">
								<b>- 직급</b>
								</label> : 
								${ovo.auth}
							</td>
						</tr>
						<tr>
							<td style="text-align: left;">
								<label class="w3-text-indigo">
								<b>- 이름</b>
								</label> : 
								${ovo.name}
							</td>
						</tr>
					</table>
				</div>
			<div class="w3-container w3-indigo">
			<h5><i class="fa fa-user"></i>  구매자</h5>
			</div>
			<div class="w3-card-2 w3-white w3-padding">
				<table class="w3-small">
					<tr>
						<td style="text-align: left;">
							<label class="w3-text-indigo">
							<b>- 이름</b>
							</label> : 
							${ovo.customer}
						</td>
					</tr>
					<tr>
						<td style="text-align: left;">
							<label class="w3-text-indigo">
							<b>- 주소</b>
							</label> : 
							${ovo.address}
						</td>
					</tr>
				</table>
			</div>
			<div class="w3-container w3-indigo">
				<h5><i class="fa fa-cube"></i>  제품</h5>
			</div>
			<div class="w3-card-2 w3-white w3-padding">
				<table class="w3-small">
					<tr>
						<td style="text-align: left;">
							<label class="w3-text-indigo">
							<b>- 코드</b>
							</label> : 
							${ovo.procode}
						</td>
					</tr>
					<tr>
						<td style="text-align: left;">
							<label class="w3-text-indigo">
							<b>- 제품명</b>
							</label> : 
							${ovo.proname}
						</td>
					</tr>
					<tr>
						<td style="text-align: left;">
							<label class="w3-text-indigo">
							<b>- 수익</b>
							</label> : 
							<fmt:formatNumber value="${ovo.profit}" pattern="#,###" />
						</td>
					</tr>
					<tr>
						<td style="text-align: left;">
							<label class="w3-text-indigo">
							<b>- 수당</b>
							</label> : 
							<fmt:formatNumber value="${ovo.allowance}" pattern="#,###" />
						</td>
					</tr>
				</table>
			</div>
			<br>
			</div>
		</div>
	</div>
</div>
<div class="w3-center">
	<c:if test="${ovo.checks!='1'&&authpage!='ROLE_EMPLOYEE'}"><button class="w3-btn w3-indigo w3-text-white" onclick="javascript:corders('${ovo.id}')">판매승인</button></c:if>
	<c:if test="${ovo.checks!='1'&&(ovo.empno==memberInfo.empno||authpage!='ROLE_EMPLOYEE')}"><button onclick="javascript:dorders('${ovo.id}')" class="w3-btn w3-indigo w3-text-white">등록취소</button></c:if>
	<c:if test="${ovo.checks!='1'&&ovo.empno==memberInfo.empno}"><button onclick="javascript:morders('${ovo.id}')" class="w3-btn w3-indigo w3-text-white">수정</button></c:if>
	<button onclick="javascript:jump('${ovo.checks}')" class="w3-btn w3-indigo w3-text-white">목록</button>
</div>

</body>
</html>