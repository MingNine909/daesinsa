<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- XEICON CDN -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- Common CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common/header_footer.css">
<!-- í°í¸ -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/shopbasket.css">

<title>장바구니</title>
<body>
	<jsp:include page="../common/template_header.jsp"></jsp:include>

	<div class="shopbasket_title">
		<h2 class="shopbasket_title_content">Shopbasket</h2>


		<div class="content_subject">
			<span>장바구니</span>
		</div>
		<!-- 장바구니 리스트 -->
		<div class="content_middle_section"></div>
		<!-- 장바구니 가격 합계 -->
		<!-- shopbasketInfo -->
		<div class="content_totalCount_section">

			<table class="subject_table">
				<caption>표 제목 부분</caption>
				<tbody>

					<tr>
						<th class="td_width_1"></th>
						<th class="td_width_2"></th>
						<th class="td_width_3">상품명</th>
						<th class="td_width_4">가격</th>
						<th class="td_width_4">수량</th>
						<th class="td_width_4">합계</th>
						<th class="td_width_4">삭제</th>
					</tr>
				</tbody>
			</table>
			<table class="shopbasket_table">
				<caption>표 내용 부분</caption>
				<tbody>
					<c:forEach items="${shopbasket}" var="sb">
						<tr>
							<td class="td_width_1"><input type="checkbox"
								class="individual_shopbasket_checkbox input_size_20"
								checked="checked"> <input type="hidden"
								class="individual_bookPrice_input" value="${sb.itemPrice}">
								<input type="hidden" class="individual_bookCount_input"
								value="${sb.itemCount}"> <input type="hidden"
								class="individual_totalPrice_input"
								value="${sb.salePrice * sb.itemCount}"> <input
								type="hidden" class="individual_totalPoint_input"
								value="${sb.totalPoint}"></td>
							<input type="hidden" class="individual_p_id_input"
								value="${sb.p_id}">

							<td class="td_width_2"></td>
							<td class="td_width_3">${sb.itemName}</td>
							<td class="td_width_4 price_td"><del>
									정가 :
									<fmt:formatNumber value="${sb.itemPrice}" pattern="#,### 원" />
								</del><br> 판매가 : <span class="red_color"><fmt:formatNumber
										value="${sb.salePrice}" pattern="#,### 원" /></span><br></td>
							<td class="td_width_4 table_text_align_center">
								<div class="table_text_align_center quantity_div">
									<input type="text" value="${sb.bookCount}"
										class="quantity_input">
									<button class="quantity_btn plus_btn">+</button>
									<button class="quantity_btn minus_btn">-</button>
									<a class="quantity_modify_btn"
										data-shopbasketId="${sb.shopbasketId}">변경</a>
							</td>
							<td class="td_width_4 table_text_align_center"><fmt:formatNumber
									value="${sb.salePrice * sb.itemCount}" pattern="#,### 원" /></td>
							<td class="td_width_4 table_text_align_center delete_btn"><button
									class="delete_btn" data-shopbasketid="${sb.p_id}">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="list_table">
			</table>
		</div>
		<!-- 가격 종합 -->
		<div class="content_total_section">
			<div class="total_wrap">
				<table>
					<tr>
						<td>
							<table>
								<tr>
									<td>총 상품 가격</td>
									<td><span class="totalPrice_span"></span> 원</td>
								</tr>
								<tr>
									<td>배송비</td>
									<td><span class="delivery_price">무료</span></td>
								</tr>
								<tr>
									<td>총 주문 상품수</td>
									<td><span class="totalKind_span"></span>종 <span
										class="totalCount_span"></span></td>
								</tr>
							</table>
						</td>
						<td>
							<table>
								<tr>
									<td></td>
									<td></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<div class="boundary_div">구분선</div>
				<table>
					<tr>
						<td>
							<table>
								<tbody>
									<tr>
										<td><strong>총 결제 예상 금액</strong></td>
										<td><span class="finalTotalPrice_span">70000</span> 원</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td>
							<table>
								<tbody>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</table>
			</div>

		</div>
		<div class="btn_content_section">
			<a class="order_btn">주문하기</a>
		</div>
		<!-- 수량 조정 form -->
		<form action="/shopbasket/update" method="post"
			class="quantity_update_form">
			<input type="hidden" name="shopbasketId" class="update_shopbasketId">
			<input type="hidden" name="bookCount" class="update_bookCount">
			<input type="hidden" name="memberId" value="${member.memberId}">
		</form>
		<!-- 삭제 form -->
		<form action="/shopbasket/delete" method="post"
			class="quantity_delete_form">
			<input type="hidden" name="shopbasketId" class="delete_shopbasketId">
			<input type="hidden" name="memberId" value="${member.memberId}">
		</form>
		<!-- 주문 form -->
		<form action="/order/${member.memberId}" method="get"
			class="order_form"></form>
	</div>





	<script>
		$(document).ready(function() {

			setTotalInfo();
			/* 종합 정보 섹션 정보 삽입 */
			/* 					let totalPrice = 0; // 총 가격
			 let totalCount = 0; // 총 갯수
			 let totalKind = 0; // 총 종류
			 let finalTotalPrice = 0; // 최종 가격(총 가격 + 배송비)	

			 $(".shopbasket_info_td").each(
			 function(index, element) {

			 // 총 가격
			 totalPrice += parseInt($(element).find(
			 ".individual_totalPrice_input").val());
			 // 총 갯수
			 totalCount += parseInt($(element).find(
			 ".individual_itemCount_input").val());
			 // 총 종류
			 totalKind += 1;

			 });

			 /* 					/* 최종 가격 */
			/* 					finalTotalPrice = totalPrice + deliveryPrice;
			 */
			/* 값 삽입 */
			// 총 가격
			/* 					$(".totalPrice_span").text(totalPrice.toLocaleString());
			 */// 총 갯수
			/* 					$(".totalCount_span").text(totalCount);
			 */// 총 종류
			/* 					$(".totalKind_span").text(totalKind);
			 */// 최종 가격(총 가격 )
			/* 					$(".finalTotalPrice_span").text(
			 *//* 							finalTotalPrice.toLocaleString());
			 */
		});
		$(".individual_shopbasket_checkbox").on("change", function() {
			/* 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류) */
			setTotalInfo($(".shopbasket_info_td"));
		});

		function setTotalInfo() {

			let totalPrice = 0; // 총 가격
			let totalCount = 0; // 총 갯수
			let totalKind = 0; // 총 종류
			let deliveryPrice = 0; // 배송비
			let finalTotalPrice = 0; // 최종 가격(총 가격 + 배송비)

			$(".shopbasket_info_td").each(
					function(index, element) {

						if ($(element).find(".individual_shopbasket_checkbox")
								.is(":checked") === true) { //체크여부

							// 총 가격
							totalPrice += parseInt($(element).find(
									".individual_totalPrice_input").val());
							// 총 갯수
							totalCount += parseInt($(element).find(
									".individual_bookCount_input").val());
							// 총 종류
							totalKind += 1;
						}

					});

			/* 배송비 결정 */
			if (totalPrice >= 30000) {
				deliveryPrice = 0;
			} else if (totalPrice == 0) {
				deliveryPrice = 0;
			} else {
				deliveryPrice = 3000;
			}

			finalTotalPrice = totalPrice + deliveryPrice;

			/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */

			// 총 가격
			$(".totalPrice_span").text(totalPrice.toLocaleString());
			// 총 갯수
			$(".totalCount_span").text(totalCount);
			// 총 종류
			$(".totalKind_span").text(totalKind);
			// 배송비
			$(".delivery_price").text(deliveryPrice);
			// 최종 가격(총 가격 + 배송비)
			$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
		}

		/* 수량버튼 */
		$(".plus_btn").on("click", function() {
			let quantity = $(this).parent("div").find("input").val();
			$(this).parent("div").find("input").val(++quantity);
		});
		$(".minus_btn").on("click", function() {
			let quantity = $(this).parent("div").find("input").val();
			if (quantity > 1) {
				$(this).parent("div").find("input").val(--quantity);
			}
		});

		/* 수량 수정 버튼 */
		$(".quantity_modify_btn").on("click", function() {
			let sb_amount = $(this).data("sb_amount");
			let bookCount = $(this).parent("td").find("input").val();
			$(".update_sb_amount").val(sb_amount);
			$(".quantity_update_form").submit();

		});

		/* 장바구니 삭제 버튼 */
		$(".delete_btn").on("click", function(e) {
			e.preventDefault();
			const shopbasketId = $(this).data("p_id");
			$(".delete_p_id").val(p_id);
			$(".quantity_delete_form").submit();
		});
		
		
		/* 주문 페이지 이동 */	
		$(".order_btn").on("click", function(){
			
			let form_contents ='';
			let orderNumber = 0;
			
			$(".shopbasket").each(function(index, element){
				
				if($(element).find(".individual_shopbasket_checkbox").is(":checked") === true){	//체크여부
					
					let p_id = $(element).find(".individual_p_idd_input").val();
					let sb_amount = $(element).find(".individual_sb_amount_input").val();
					
					let p_id_input = "<input name='orders[" + orderNumber + "].p_id' type='hidden' value='" + p_id + "'>";
					form_contents += bookId_input;
					
					let sb_amount_input = "<input name='orders[" + orderNumber + "].sb_amount' type='hidden' value='" + sb_amount + "'>";
					form_contents += sb_amount_input;
					
					orderNumber += 1;
					
				}
			});	

			$(".order_form").html(form_contents);
			$(".order_form").submit();
			
		});
	</script>





	<jsp:include page="../common/template_footer.jsp"></jsp:include>
	<!-- 부트스트랩 스크립트 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>



</body>
</html>