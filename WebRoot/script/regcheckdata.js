function checkdata() {
	var ssn=form.username.value.toLowerCase();
	if (!checkUserName(ssn)) return false;  //�û������
	if( strlen(form.password.value)<6 || strlen(form.password.value)>16 ) {
		alert("\��ȷ�ص�¼���볤��Ϊ6-16λ��������Ӣ�ġ����֡������ַ���")
		form.password.focus()
		return false;
	}
	if( strlen2(form.password.value) ) {
		alert("\���������а����˷Ƿ��ַ���������Ӣ�ġ����֡������ַ���")
		form.password.focus()
		return false;
	}
	if( form.password.value == form.username.value ) {
		alert("\�û��������벻����ͬ��")
		form.password.focus()
		return false;
	}
	if( form.password2.value =="" ) {
		alert("\����������ȷ�ϣ�")
		form.password2.focus()
		return false;
	}
	if( form.password2.value != form.password.value ) {
		alert("\�����������벻һ�£�")
		form.password.focus()
		return false;
	}
	if( form.phone.value =="" ) {
		alert("\������绰��")
		form.phone.focus()
		return false;
	}
	if( form.addr.value =="" ) {
		alert("\�������ַ��")
		form.addr.focus()
		return false;
	}
	if( form.username.value =="" ) {
		alert("\�������û�����")
		form.username.focus()
		return false;
	}
	if( form.password.value =="" ) {
		alert("\���������룡")
		form.password.focus()
		return false;
	}
	
	return true;
}

function checkUserName(ssn){
	if( ssn.length<3 || ssn.length>18 ) {
		alert("\��������ȷ���û���,�û�������Ϊ3-18λ��")
		form.username.focus()
		return false;
	}
	if (isWhiteWpace(ssn)){
		alert("\��������ȷ���û���,�û����в��ܰ����ո�")
		form.username.focus()
		return false;
	}
	if (!isSsnString(ssn)){
		alert("\    �Բ�����ѡ����û�������ȷ���ѱ�ռ�ã��û���\n��a��z��Ӣ����ĸ(�����ִ�Сд)��0��9�����֡��㡢��\n�Ż��»�����ɣ�����Ϊ3��18���ַ���ֻ�������ֻ���ĸ\n��ͷ�ͽ�β,����:kyzy_001��")
		form.username.focus()
		return false;
	}
	return true;
}

function strlen(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) len+=2; else len++;
	}
	return len;
}

function strlen2(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) return true;
	}
	return false;
}

function isWhiteWpace (s)
{
	var whitespace = " \t\n\r";
	var i;
	for (i = 0; i < s.length; i++){   
		var c = s.charAt(i);
		if (whitespace.indexOf(c) >= 0) {
		  	return true;
		}
	}
	return false;
}

function isSsnString (ssn)
{
	var re=/^[0-9a-z][\w-.]*[0-9a-z]$/i;
	if(re.test(ssn))
		return true;
	else
		return false;
}

function checkssn(gotoURL) {
   var ssn=form.username.value.toLowerCase();
   if (checkUserName(ssn)){
	   var open_url = gotoURL + "?username=" + ssn;
	   window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=322,height=200');
	}
}