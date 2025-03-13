function inputIdChk() {
	frm.idBtnCheck.value = "idUncheck";   /*아이디를 쓰지 않으면 체크가 안된 걸로 하기*/
}

function idCheck(id) {   /*함수에 받을 값*/
	frm.idBtnCheck.value = "idCheck";
	if(id == "") {   /*아무값이 없으면 실행*/
		alert("아이디를 입력하세요");
		frm.id.focus();    /*아이디 란에 포커스를 맞추기*/
		return;
	}
	url = "idCheck.jsp?id=" + id;   /*"idCheck.jsp?id=" 띄어쓰기X*/
	window.open(url, "IDCheck", "width=100, heigth=100");  /*url을 별도의 창으로 열거임 이 사이즈로*/
}

function inputCheck() {
	if(frm.idBtnCheck.value != "idCheck"){   /*중복확인을 누르지 않았다면*/
		alert("아이디 중복 체크를 눌러주세요");
		return;
	}
	if(frm.pwd.value == "") {
		alert("비밀번호를 입력해주세요");
		frm.pwd.focus();
		return;
	}
	if(frm.pwd.value != frm.repwd.value) {
		alert("비밀번호가 다릅니다");
		return;
	}
	if(frm.name.value == "") {
		alert("이름을 입력하세요");
		frm.name.focus();
		return;
	}
	
	frm.submit();  /*submit해줘야 회원가입했을 때 정보가 갈 수 있음*/
}