<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    <title>Dashboard Template for Bootstrap</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h2 class="sub-header">管理员信息</h2>
                <div class="sub-header">
                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#insertAdmin">添加管理员</button>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="col-md-2">序号</th>
                                <th class="col-md-2">姓名</th>
                                <th class="col-md-2">密码</th>
                                <th class="col-md-3">权限</th>
                                <th class="text-center col-md-3">编辑</th>
                            </tr>
                        </thead>
                        <tbody id="userList">
                        </tbody>
                    </table>
                    <nav aria-label="...">
                        <ul class="pager">
                            <li class="previous" style="cursor: pointer;"><a><span
									aria-hidden="true">&larr;</span> 上一页</a></li>
                            <li class="next" style="cursor: pointer;"><a>下一页 <span
									aria-hidden="true">&rarr;</span></a></li>
                        </ul>
                    </nav>
                </div>
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
    window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
    </script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
var pages = 1;
var limit = 5;
var totalPages = 0;
//页面加载完成后，显示第一页的管理员信息
$(function() {
    $.ajax({
        url: "getPagesInfo",
        type: "post",
        data: {
            'pages': pages,
            'limit': limit
        },
        dataType: "json",
        success: function(result) {
            totalPages = result.totalPages;
        }
    })

    $.ajax({
        url: "getUserByPage",
        type: "post",
        data: {
            'pages': pages,
            'limit': limit
        },
        dataType: "json",
        success: function(result) {
        	$.each(result, function(i, val) {
            	var identity;
            	if(val.identity === 1){
            		identity = "超管";
            	}else{
            		identity = "管理员";
            	}
                $("#userList").append(
                    "<tr><td>" +
                    val.id +
                    "</td><td>" +
                    val.username +
                    "</td><td>" +
                    val.password +
                    "</td><td>" +
                    identity +
                    "<td class='text-center'><button type='button' class='btn btn-info self-btn'>编辑</button>&nbsp;<button type='button' class='btn btn-danger self-btn'>删除</button></td></tr>")
            })
        }
    })

    //判断是否为第一页，为第一页关闭上一页按钮
    if (pages === 1) {
        $(".previous").addClass("disabled");
    }
});
//添加用户
$("#insertUser").click(function(){
	var userName = $("#inputUsername").val();
	var userPass = $("#inputPassword").val();
	var userIdentity = $("input[type=radio]:checked").val();
	if (userName.length != 0 && userName != null
			&& userPass.length != 0 && userPass != null) {
		$.ajax({
			url : "insertUser",
			type : "post",
			data : {
				username : userName,
				password : userPass,
				identity : userIdentity,
			},
			dataType : "text",
			success : function(result) {
				console.log(result);
				
			}
		})
	} else {
		alert("请输入完整信息！");
	}
/* 	$(".form-horizontal").submit(); */
})
//单击上一页出发事件
$(".previous").click(
    function() {
        $(".next").removeClass("disabled");
        if (pages === 1) {
            return;
        }
        pages--;
        if (pages === 1) {
            $(".previous").addClass("disabled");
        }
        $.ajax({
            url: "getUserByPage",
            type: "post",
            data: {
                'pages': pages,
                'limit': limit
            },
            dataType: "json",
            success: function(result) {
                $("#userList").empty();
                $.each(result, function(i, val) {
                	var identity;
                	if(val.identity === 1){
                		identity = "超级管理员";
                	}else{
                		identity = "普通管理员";
                	}
                    $("#userList").append(
                        "<tr><td>" +
                        val.id +
                        "</td><td>" +
                        val.username +
                        "</td><td>" +
                        val.password +
                        "</td><td>" +
                        identity +
                        "<td class='text-center'><button type='button' class='btn btn-info self-btn'>编辑</button>&nbsp;<button type='button' class='btn btn-danger self-btn'>删除</button></td></tr>")
                })
            }
        })
    })
//单击下一页出发事件
$(".next").click(
    function() {
        $(".previous").removeClass("disabled");
        if (pages === totalPages) {
            return;
        }
        pages++;
        if (pages === totalPages) {
            $(".next").addClass("disabled");
        }
        $.ajax({
            url: "getUserByPage",
            type: "post",
            data: {
                'pages': pages,
                'limit': limit
            },
            dataType: "json",
            success: function(result) {
                $("#userList").empty();
                $.each(result, function(i, val) {
                	var identity;
                	if(val.identity === 1){
                		identity = "超级管理员";
                	}else{
                		identity = "普通管理员";
                	}
                    $("#userList").append(
                        "<tr><td>" +
                        val.id +
                        "</td><td>" +
                        val.username +
                        "</td><td>" +
                        val.password +
                        "</td><td>" +
                        identity +
                        "<td class='text-center'><button type='button' class='btn btn-info self-btn'>编辑</button>&nbsp;<button type='button' class='btn btn-danger self-btn'>删除</button></td></tr>")
                })
            }
        })
    })
</script>

</html>