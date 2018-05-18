<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.lang.*,com.platinum.pojo.*,java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	height: 600px;
}
</style>

</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Project name</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a></a></li>
                    <li><a>欢迎&nbsp;&nbsp;&nbsp;&nbsp;${user.username}</a></li>
                    <li><a></a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="#">管理员信息</a></li>
                    <li><a href="#">司机信息</a></li>
                    <li><a href="#">车辆信息</a></li>
                </ul>
            </div>
            <div id="allmap" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			</div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="insertAdmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">添加管理员</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="inputUsername" class="col-sm-2 control-label">用户名：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputUsername" placeholder="请输入用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-sm-2 control-label">密码：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputPassword" placeholder="请输入密码" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">权限：</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="identity" id="inlineRadio2" value="1" checked="checked"> 超级管理员
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="identity" id="inlineRadio3" value="2"> 普通管理员
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="insertUser">添加</button>
                </div>
            </div>
        </div>
    </div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script>
		window.jQuery || document.write('<script src="./js/vendor/jquery.min.js"><\/script>')
	</script>
	<script
		src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script type="text/javascript">
		// 百度地图API功能  
		var map = new BMap.Map("allmap");// 创建Map实例  
		map.centerAndZoom(new BMap.Point(116.331398, 39.897445), 18);// 初始化地图,设置中心点坐标和地图级别  
		map.enableScrollWheelZoom(true);//开启鼠标滚轮缩放  
		map.addControl(new BMap.NavigationControl()); //添加平移缩放控件  
		map.addControl(new BMap.ScaleControl()); //添加比例尺控件  
		map.addControl(new BMap.OverviewMapControl({
			isOpen : true
		})); //添加缩略地图控件  
		
	</script>
	<script type="text/javascript">
	

	var gps_longitude = new Array();
	var gps_latitude = new Array();
	
	function getData(){
		$.ajax({
	        url: "getAllGps",
	        type: "post",
	        dataType: "json",
	        success: function(result) {
	        	$.each(result, function(i, val) {
	        		gps_longitude.push(val.longitude);
	        		gps_latitude.push(val.latitude);
	            })
	        }
	    })
	}	

	function addMapOverlay(){  
		var new_point = new BMap.Point(gps_longitude.pop(),
				gps_latitude.pop());
		var marker = new BMap.Marker(new_point); // 创建标注  
		map.addOverlay(marker); // 将标注添加到地图中  
		map.panTo(new_point);
	}
	
	function frash(){  
	    map.clearOverlays();//清空地图上标注点    
	    addMapOverlay();  
	}
	getData();
	setInterval("frash()",2000);     
</script>
</body>
</html>
