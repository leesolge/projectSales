<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Title</title>


<script type="text/javascript">
	function registOrder() {
		var pc = document.forms['regist'].procode.value;
		var pa = document.forms['regist'].proamount.value;
		var cu = document.forms['regist'].customer.value;
		var ad = document.forms['regist'].address.value;
		if (confirm("입력하신 사항이 모두 확실합니까?\n제품번호 : " + pc + "\n주문수량 : " + pa
				+ "\n고객명 : " + cu + "\n고객주소 : " + ad) == true) {
			document.forms['regist'].submit();
		} else {
			return;
		}
	}
	function toList() {
		document.forms['list'].submit();
	}
</script>
</head>
<body>

	

	<form name="list" action="/erp/order/list" method="post"></form>

	<form name="regist" action="/erp/order/regist" method="post">
		<table>
			<tr>
				<td><input type="hidden" name="id" value="0"> 등록자 사번</td>
				<td><select name="empno" required="required">
						<c:forEach var="mlist" items="${mlist}">
							<option value="${mlist.empno}">${mlist.empno}&nbsp;${mlist.name}&nbsp;${mlist.auth}&nbsp;${mlist.team}&nbsp;</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>수주상품</td>
				<td><select name="procode" required="required">
						<c:forEach var="list" items="${plist}">
							<option value="${list.procode}">${list.procode}&nbsp;${list.proname}</option>
						</c:forEach>
				</select></td>
			<tr>
				<td>주문수량</td>
				<td><input type="number" name="proamount" required="required">
				</td>
			</tr>
			<tr>
				<td>고객명</td>
				<td><input type="text" name="customer" required="required">
				</td>
			</tr>
		</table>
		고객주소 <input type="button" onclick="sample3_execDaumPostcode()" value="주소 찾기">
		<div id="wrap" style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
			<img
				src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
				id="btnFoldWrap"
				style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
				onclick="foldDaumPostcode()" alt="접기 버튼">
		</div>
		<input type="text" id="sample3_address" name="address"
			required="required" placeholder="주소"> <input type="hidden"
			name="checks" value="0"> <input type="hidden" name="deleted"
			value="0">
	</form>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		// 우편번호 찾기 찾기 화면을 넣을 element
		var element_wrap = document.getElementById('wrap');

		function foldDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_wrap.style.display = 'none';
		}

		function sample3_execDaumPostcode() {
			// 현재 scroll 위치를 저장해놓는다.
			var currentScroll = Math.max(document.body.scrollTop,
					document.documentElement.scrollTop);
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = data.address; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 기본 주소가 도로명 타입일때 조합한다.
							if (data.addressType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample3_address').value = fullAddr;

							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_wrap.style.display = 'none';

							// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
							document.body.scrollTop = currentScroll;
						},
						// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
						onresize : function(size) {
							element_wrap.style.height = size.height + 'px';
						},
						width : '100%',
						height : '100%'
					}).embed(element_wrap);

			// iframe을 넣은 element를 보이게 한다.
			element_wrap.style.display = 'block';
		}
	</script>
	<br>
	<button onclick="javascript:registOrder()">등록</button>
	<br>
	<button onclick="javascript:toList()">목록</button>
</body>
</html>