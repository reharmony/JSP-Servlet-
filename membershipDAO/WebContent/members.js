/**
 * 
 */

function infoConfirm() { // 회원가입시 입력한 정보 체크
	if(document.reg_frm.id.value.length == 0) { // document는 현재페이지(join.jsp), reg_frm은 폼이름, id는 input이름, value는 입력받은 값, length로 공백 체크
		alert("아이디를 입력해주세요."); // 알림 팝업
		reg_frm.id.focus(); // 해당 입력칸에 커서 위치시키기
		return;
	}
	
	if(document.reg_frm.id.value.length < 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
		reg_frm.id.focus();
		return;
	}
	
	if(document.reg_frm.pw.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		reg_frm.pw.focus();
		return;
	}
	
	if(document.reg_frm.pw.value != document.reg_frm.pw_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		reg_frm.pw_check.focus();
		return;
	}
	
	if(document.reg_frm.name.value.length == 0) {
		alert("이름을 입력해주세요.");
		reg_frm.name.focus();
		return;
	}
	
	if(document.reg_frm.eMail.value.length == 0) {
		alert("메일을 입력해주세요.");
		reg_frm.eMail.focus();
		return;
	}
	
	if(document.reg_frm.address.value.length == 0) {
		alert("주소를 입력해주세요.");
		reg_frm.address.focus();
		return;
	}
	
	document.reg_frm.submit(); // 모든 체크 메소드를 다 통과하면 최종적으로 submit
	
}


// 회원정보 수정시 입력한 정보 체크
function updateInfoConfirm() { 
	if(document.reg_frm.pw.value == "") { // document는 modify.jsp
		alert("비밀번호를 입력하세요.");
		document.reg_frm.pw.focus();
		return;
	}
	
	if(document.reg_frm.pw.value != document.reg_frm.pw_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.reg_frm.pw_check.focus();
		return;
	}
	
	if(document.reg_frm.eMail.value.length == 0) {
		alert("메일을 입력해주세요.");
		reg_frm.eMail.focus();
		return;
	}
	
	if(document.reg_frm.address.value.length == 0) {
		alert("주소를 입력해주세요.");
		reg_frm.address.focus();
		return;
	}
	
	document.reg_frm.submit();
}