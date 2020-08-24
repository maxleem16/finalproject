<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<link rel="stylesheet" href="/resources/css/style2.css">
	<title>결제후원</title>
</head>
<body>
	<form name="frm1" action="insert2" method="post">
		<input type="hidden" value="1" name="donationMethod">
		<table border=1 id="tbldonInsert">
			<tr>
				<td class="donItitle">후원자 ID</td>
			</tr>
			<tr>
				<td class="donIcontent"><input type="text" name="sponsor" value="${id}" readonly></td>
			</tr>
			<tr>
				<td class="donItitle">후원할 금액</td>
			</tr>
			<tr>
				<td class="donIcontent"><input type="number" name="price"></td>
			</tr>
			<tr>
				<td class="donItitle">한마디</td>
			</tr>
			<tr>
				<td class="donIcontent"><textarea name="sponsorContent" cols=90 rows=10></textarea></td>
			</tr>
		</table>
		<img src="/resources/img/pay.png" class="icon" style="cursor:pointer;width:200px;margin-left:36%;">
	</form>
</body>
<script>
	$(".icon").on("click",function(){
		var id=$(frm1.sponsor).val();
		var price=$(frm1.price).val();
		var content=$(frm1.sponsorContent).val();
		if(id==""){
			alert("로그인 후 이용바랍니다.");
		}else if(price==""){
			alert("금액을 입력해주세요.");
		}else{
			kakaopay();
		}
	});

	//카카오페이
	function kakaopay(){
	    $(function(){
	        var IMP = window.IMP; // 생략가능
	        IMP.init('imp20351937'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	        var msg;
	        var price=$(frm1.price).val();
	        
	        IMP.request_pay({
	            pg : 'kakaopay',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : '후원하기',
	            amount : price,
	            buyer_email : 'tmdduqskfk13@naver.com',
	            buyer_name : '김승엽',
	            buyer_tel : '010-6471-8019',
	            buyer_addr : '인천광역시 부평구 영성중로16',
	            buyer_postcode : '123-456',
	            m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	        }, function(rsp) {
	            if ( rsp.success ) {
	                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	                jQuery.ajax({
	                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	                    type: 'POST',
	                    dataType: 'json',
	                    data: {
	                        imp_uid : rsp.imp_uid
	                        //기타 필요한 데이터가 있으면 추가 전달
	                    }
	                }).done(function(data) {
	                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                    if ( everythings_fine ) {
	                        msg = '결제가 완료되었습니다.';
	                        msg += '\n고유ID : ' + rsp.imp_uid;
	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                        msg += '\결제 금액 : ' + rsp.paid_amount;
	                        msg += '카드 승인번호 : ' + rsp.apply_num;
	                        alert(msg);
	                    } else {
	                        //[3] 아직 제대로 결제가 되지 않았습니다.
	                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                    }
	                });
	                //성공시 이동할 페이지
	                frm1.submit();
	            } else {
	                msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                //실패시 이동할 페이지
	                location.href="/donation/insert";
	                alert(msg);
	            }
	        });
	    });
	}
</script>
</html>