<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="https://v3.bootcss.com/favicon.ico">

<title>Signin Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">



<!-- Custom styles for this template -->
<link href="./css/signin.css" rel="stylesheet">
<script src="./js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("button[name=btn]").click(
			function() {
				var userName = $("#inputUsername").val();
				var userPass = $("#inputPassword").val();
				if (userName.length != 0 && userName != null
						&& userPass.length != 0 && userPass != null) {
					$.ajax({
						url : "login",
						type : "post",
						data : {
							username : userName,
							password : userPass
						},
						dataType : "text",
						success : function(result) {
							console.log(result);
							if (result === "failed") {
								alert("密码或用户名输入错误!");
							} else if(result === "superAdmin"){
								window.location.href = "superIndex";
							} else if(result === "normalAdmin"){
								window.location.href = "index";
							} else{
								alert("未知错误！");
							}
						}
					})
				} else {
					alert("请输入完整信息！");
				}
			});
});
</script>

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="./js/ie8-responsive-file-warning.js"></script><![endif]-->

<script src="./js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class="container">
		<form class="form-signin">
			<h2 class="form-signin-heading">登陆</h2>
			<label for="inputUsername" class="sr-only">用户名：</label> 
			<input type="text" id="inputUsername" class="form-control" placeholder="Username" required autofocus> 
			<label for="inputPassword" class="sr-only">密码：</label> 
			<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
			<!-- 记住用户和密码  -->
			<!-- <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div> -->
			<button class="btn btn-lg btn-primary btn-block" type="button"
				name="btn">登陆</button>
		</form>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

