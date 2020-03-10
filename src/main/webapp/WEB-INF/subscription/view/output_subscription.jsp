<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subscription</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/sbadmin2/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<%-- <link href="${pageContext.request.contextPath}/sbadmin2/css/sb-admin-2.min.css" rel="stylesheet"> --%>

<!-- Custom styles for this page -->
<%-- <link href="${pageContext.request.contextPath}/sbadmin2/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> --%>
</head>
<body class="bg-gradient-primary">
	<div class="container" ng-controller="output_subscription_ctrl">
		<!-- Outer Row -->
		<div class="row justify-content-center" ng-init="initiation();">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<div class="row" style="width: 100%">
							<div style="width: 100%">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mt-4 mb-4">Thank you
										subscribed with us!</h1>
								</div>
								<div class="container-fluid">
									<h1 class="h3 text-gray-800">Subscription Details</h1>
									<div class="form-group">
										Name<input type="text" ng-model="user.name"
											class="form-control" disabled>
									</div>
									<div class="form-group">
										Email address<input type="email" class="form-control"
											ng-model="user.email" placeholder="name@example.com" disabled>
									</div>
									<div class="form-group">
										Subscription Plan<input type="text" ng-model="plan"
											class="form-control" disabled>
									</div>
									<hr>
								</div>
								<div class="container-fluid">
									<!-- DataTales Example -->
									<div class="card shadow mb-4">
										<div class="card-header py-3">
											<h6 class="m-0 font-weight-bold text-primary">Invoice
												Issue Dates</h6>
										</div>
										<div class="card-body">
											<div class="table-responsive">
												<table table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">
													<thead>
														<tr>
															<th>Id</th>
															<th>Issue Date</th>
															<th>Status Invoice</th>
														</tr>
													</thead>
													<tfoot>
														<tr>
															<th>Id</th>
															<th>Issue Date</th>
															<th>Status Invoice</th>
														</tr>
													</tfoot>
													<tbody>
														<tr ng-repeat="schedule in schedules">
															<td>{{schedule.id}}</td>
															<td>{{schedule.invoiceDate | date:'dd/MM/yyyy'}}</td>
															<td ng-if="(schedule.isSend)">Sent</td>
															<td ng-if="!(schedule.isSend)">Not Send</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="text-center">
										<a href="/#!" class="btn btn-secondary btn-icon-split mb-4"> <span
											class="icon text-white-50"> <i
												class="fas fa-arrow-left"></i>
										</span> <span class="text">New Subscription</span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/sbadmin2/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/sbadmin2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/sbadmin2/vendor/jquery-easing/jquery.easing.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/sbadmin2/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/sbadmin2/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Custom scripts for all pages-->

	<script
		src="${pageContext.request.contextPath}/sbadmin2/js/sb-admin-2.min.js"></script>



	<!-- Page level custom scripts -->
	<%-- <script src="${pageContext.request.contextPath}/sbadmin2/js/demo/datatables-demo.js"></script> --%>
</body>
</html>