<?
function errmsg($msg) //자바로 에러메세지 출력
{ echo (" <script>
		window.alert('$msg')
		history.go(-1)
		</script> ");
		exit;}
?>