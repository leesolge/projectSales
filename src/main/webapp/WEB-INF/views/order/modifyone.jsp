<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	
<script type="text/javascript">
	function registOrder(){
		var pc = document.forms['regist'].procode.value;
		var pa = document.forms['regist'].proamount.value;
		var cu = document.forms['regist'].customer.value;
		var ad = document.forms['regist'].address.value;
		if (confirm("입력하신 사항이 모두 확실합니까?\n제품번호 : "+pc+"\n주문수량 : "+pa+"\n고객명 : "+cu+"\n고객주소 : "+ad) == true){
			document.forms['regist'].submit();
		}else{
		    return;
		}
	}
	function toList(){
		document.forms['list'].submit();
	}
</script>
	
	<body>
	<form name="list" action="/erp/order/list" method="post">
	</form>
	
	<form name="regist" action="/erp/order/modify" method="post">
		<table>
			<tr>
				<td>
					<input type="hidden" name="id" value="${mo.id}">
					등록자
				</td>
				<td>
					<select name="empno" required="required">
						<c:forEach var="mlist" items="${mlist}">
							<c:if test="${mo.empno==mlist.empno}">
								<option value="${mlist.empno}" selected="selected">${mlist.empno}&nbsp;${mlist.name}&nbsp;${mlist.auth}&nbsp;${mlist.team}&nbsp;</option>
							</c:if>
							<c:if test="${mo.empno!=mlist.empno}">
								<option value="${mlist.empno}">${mlist.empno}&nbsp;${mlist.name}&nbsp;${mlist.auth}&nbsp;${mlist.team}&nbsp;</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					수주상품
				</td>
				<td>
					<select name="procode" required="required">
						<c:forEach var="list" items="${plist}">
							<c:if test="${mo.procode==list.procode}">
								<option value="${list.procode}" selected="selected">${list.procode}&nbsp;${list.proname}</option>
							</c:if>
							<c:if test="${mo.procode!=list.procode}">
								<option value="${list.procode}">${list.procode}&nbsp;${list.proname}</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			<tr>
				<td>
					주문수량
				</td>
				<td>
					<input type="number" name="proamount" value="${mo.proamount}" required="required">
				</td>
			</tr>
			<tr>
				<td>
					고객명
					<input type="hidden" name="regdate" value="${mo.regdate}">
				</td>
				<td>
					<input type="text" name="customer" required="required" value="${mo.customer}">
				</td>
			</tr>
		</table>
					고객주소 <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기">
		<input type="text" id="sample6_address" name="address" required="required" placeholder="주소" value="${mo.address}">
		<input type="hidden" name="checks" value="0">
		<input type="hidden" name="deleted"	value="0">
		<span id="guide" style="color:#999"></span>
	</form>
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address').focus();
            }
        }).open();
    }
</script>
	
	<button onclick="javascript:registOrder()">수정</button><br>
	<button onclick="javascript:toList()">목록</button>
	</body>
</html>