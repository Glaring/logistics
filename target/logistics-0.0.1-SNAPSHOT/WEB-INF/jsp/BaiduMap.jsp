<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>系统主页</title>

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Custom styles for this template -->
<link href="./css/dashboard.css" rel="stylesheet">
<script type="text/javascript"
	src="http://api.map.baidu.com/getscript?v=2.0&ak=DT0TVmKbAUMjMX8kWIiNgT5LEFHyNU9w&services=&t=20180"></script>
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="./js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="./js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
#allmap {
	height: 640px;
}
</style>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Project name</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a></a></li>
					<li><a>欢迎&nbsp;&nbsp;&nbsp;&nbsp;${user.u_name }</a></li>
					<li><a></a></li>
				</ul>
				<!-- 搜索快递车功能  -->
				<!-- <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form> -->
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="#">Overview <span class="sr-only">(current)</span></a></li>
					<li><a href="#">Reports</a></li>
					<li><a href="#">Analytics</a></li>
					<li><a href="#">Export</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="">Nav item</a></li>
					<li><a href="">Nav item again</a></li>
					<li><a href="">One more nav</a></li>
					<li><a href="">Another nav item</a></li>
					<li><a href="">More navigation</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="">Nav item again</a></li>
					<li><a href="">One more nav</a></li>
					<li><a href="">Another nav item</a></li>
				</ul>
			</div>
			<div id="allmap"
				class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">




			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="./js/vendor/jquery.min.js"><\/script>')</script>
	<script
		src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script type="text/javascript">  
    // 百度地图API功能  
    var map = new BMap.Map("allmap");// 创建Map实例  
    map.centerAndZoom(new BMap.Point(116.331398,39.897445),12);// 初始化地图,设置中心点坐标和地图级别  
    map.enableScrollWheelZoom(true);//开启鼠标滚轮缩放  
    map.addControl(new BMap.NavigationControl()); //添加平移缩放控件  
    map.addControl(new BMap.ScaleControl());  //添加比例尺控件  
    map.addControl(new BMap.OverviewMapControl({isOpen: true}));  //添加缩略地图控件  
      
    // 从后台获取物资位置信息，并显示在地图上  
    $.ajax({
		url : "getLastestGpsInf",
		type : "post",
		dataType : "json",
		success : function(result) {
			if (result != undefined) { 
				var new_point = new BMap.Point(result.gps_longitude,result.gps_latitude);  
		        var marker = new BMap.Marker(new_point);  // 创建标注  
		        map.addOverlay(marker);              // 将标注添加到地图中  
		        map.panTo(new_point);   //将地图的中心点更改为从接口获取的指定的点。  
            } else{
				alert("获取地址失败！")
			}
		}
	})
</script>
</body>
</html>
