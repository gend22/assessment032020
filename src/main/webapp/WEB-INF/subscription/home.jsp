<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="-webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none;" oncontextmenu="return false">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subscription</title>

<link href="${pageContext.request.contextPath}/sbadmin2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="${pageContext.request.contextPath}/sbadmin2/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/sbadmin2/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/sbadmin2/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/sbadmin2/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/sbadmin2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>  
<script src="${pageContext.request.contextPath}/sbadmin2/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/sbadmin2/js/sb-admin-2.min.js"></script>
<script src="${pageContext.request.contextPath}/sbadmin2/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/sbadmin2/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/sbadmin2/js/demo/datatables-demo.js"></script>
<script src="${pageContext.request.contextPath}/angular-1.7.5/js/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/angular-1.7.5/js/angular-route.min.js"></script>
</head> 
<body ng-app="myApp" class="hold-transition skin-blue sidebar-mini font-roboto-regular">
	<div class="wrapper">
		<div ng-view></div>
	</div>
	
</body>
<script>
	var app = angular.module("myApp", [ "ngRoute"]);
	app.config(['$routeProvider', '$compileProvider', function($routeProvider, $compileProvider) {
		$compileProvider.imgSrcSanitizationWhitelist(/^\s*(local|http|https|app|tel|ftp|file|blob|content|ms-appx|x-wmapp0|cdvfile):|data:image\//);
		$routeProvider
		.when("/",
			{
				templateUrl : "${pageContext.request.contextPath}/view/create_subscription",
				controller : "create_subscription_ctrl"
		}).
		when("/output/:id",
				{
					templateUrl : "${pageContext.request.contextPath}/view/output_subscription",
					controller : "output_subscription_ctrl"
		}).
		otherwise({
	          redirectTo: '/'
	    });
	}]);
</script>

<!-- ***** ANGULAR JS CONTROLLER ***** -->
<jsp:include page="/WEB-INF/subscription/controller/create_subscription_ctrl.jsp" />
<jsp:include page="/WEB-INF/subscription/controller/output_subscription_ctrl.jsp" />
</html>