<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./css/w3.css" type="text/css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<body>
	<form action="FoodSurveyInsertPro.do" method="post">
		<div class="survey w3-container w3-light-grey" align="center" style="margin-left:10px; margin-right:10px;">
			<div class="w3-container" style="margin:10px;">
				<input class="w3-btn page_button"  type="hidden" name="ref" value="${ref}">
				<input class="w3-btn page_button"  type="submit" value="설 문 등 록" id="submit_survey">
				<input class="w3-btn page_button"  type="button" id="btn_Q" value="질 문 추 가" >
				<input class="w3-btn page_button"  type="button" id="btn_DelA" value="질 문 삭 제">
			</div>
		</div>
	</form>
</body>

<script type="text/javascript">
	$(document).ready(	function() {
						var Q_num = 1;
						$('#btn_Q')
								.click(
										function() {
											var Q_num_ref = Q_num;
											var i = 1;
											$('<div class="w3-container Q_div' + Q_num_ref + '" > </div>').appendTo('.survey');
											
											$('<br><h3>Question. ' + Q_num_ref + '</h3>').appendTo('.Q_div'+ Q_num_ref);
											
											$('<input class="w3-input" placeholder="  Write Your Question!" type="text" name= "Q'+ Q_num_ref + '" >').appendTo('.Q_div'+ Q_num_ref);
											
											$('<table class="w3-table w3-striped w3-bordered w3-border w3-centered" border="0" id="Q' + Q_num_ref + '" align="center">').appendTo('.Q_div'+ Q_num_ref);
											
											$('</table><br>').appendTo('.Q_div' + Q_num_ref);
											
											$('<input class="w3-btn" style="margin-bottom:10px;"type="button" id="btn_A' + Q_num_ref +'" value="답변추가" >').appendTo('.Q_div'+ Q_num_ref);

											$('#btn_A' + Q_num_ref)
													.click(
															function() {
																$('<tr><td style="width:40%;">Answer. '+ i + '</td><td style="width:60%;" align="center">'+ '<input type="text" style="width:95%;" placeholder="  Write Your Answer!" class="w3-right w3-input" name="Q'+Q_num_ref+'A'+i+'" size="30"></td></tr>').appendTo('#Q' + (Q_num_ref));
																i++;
															});
													Q_num++;
											
											});

											$('#btn_DelA').click(function() {							
												Q_num--;
												$('.Q_div' + Q_num).remove();
							
											});
					});
</script>
</html>