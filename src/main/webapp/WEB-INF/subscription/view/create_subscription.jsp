<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subscription</title>
<!-- Custom styles for this page -->
 <link href="${pageContext.request.contextPath}/sbadmin2/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
	<div class="container" ng-controller="create_subscription_ctrl">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>
									<form class="user" ng-submit="createSubscription()">
										<h3>Subscribe with us.</h3>
										<div class="form-group">
											Name<input type="text" ng-model="user.name"
												class="form-control" required>
										</div>
										<div class="form-group">
											<label for="exampleFormControlInput1">Email address</label> <input
												type="email" class="form-control" ng-model="user.email"
												placeholder="name@example.com" required>
										</div>
										<div class="form-group">
											Subscription Plan
											<select class="custom-select" ng-model="user.plan" required>
												<option ng-repeat="x in plans" value="{{x.id}}">{{x.desc}}</option>
											</select> <!-- <select ng-model="user.plan" class="custom-select">
												<option value="1" selected>Daily (RM1/day)</option>
												<option value="2">Weekly (RM5/Week)</option>
												<option value="3">Monthly (RM15/Month)</option>
											</select> -->
										</div>
										<button type="submit"
											class="btn btn-primary btn-user btn-block">Submit</button>
									</form>
									<hr>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Loading Modal [START] -->
	<div class="modal fade" data-backdrop="static" id="loading_modal" role="dialog">
		<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<div class="text-center">
					<img style="width:75%" src="${pageContext.request.contextPath}/img/loading.gif"><br>
						<span>Processing...</span>
				</div>
			</div>
		</div>
		</div>
	</div>
	<!-- Loading Modal [END] -->
</body>
<body>
</html>