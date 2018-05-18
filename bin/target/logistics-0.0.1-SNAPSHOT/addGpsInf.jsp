<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GpsInf</title>
<script src="./js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<form action="addGps" method="post">
		经度：<input id="gps_longitude" type="text" name="gps_longitude" placeholder="输入经度"><br>
		纬度：<input id="gps_latitude" type="text" name="gps_latitude" placeholder="输入纬度"><br>
		<button type="button" name="btn">提交</button>
	</form>
</body>
<script type="text/javascript">
$(function() {
	$("button[name=btn]").click(
			function() {
				var gps_longitude = $("#gps_longitude").val();
				var gps_latitude = $("#gps_latitude").val();
				if (gps_longitude.length != 0 && gps_longitude != null
						&& gps_latitude.length != 0 && gps_latitude != null) {
					$.ajax({
						url : "addGps",
						type : "post",
						data : {
							gps_longitude : gps_longitude,
							gps_latitude : gps_latitude
						},
						dataType : "text",
						success : function(result) {
							result = $.trim(eval("(" + result + ")"));
							if (result == "false") {
								alert("插入失败！");
							} else {
								alert("插入成功！");

							}
						}
					})
				} else {
					alert("请输入完整信息！");
				}
			});
});
</script>
<html>