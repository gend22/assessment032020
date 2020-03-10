<script>
	app.controller('output_subscription_ctrl', function($scope, $http, $routeParams, $window, $location, $route) {
		$scope.selectedPlan;
		$scope.schedules = [];
		$scope.plans = [
			  {id : "1", desc : "Daily (RM1/day)"},
			  {id : "2", desc : "Weekly (RM5/Week)"},
			  {id : "3", desc : "Monthly (RM15/Month)"}
		];
		
		$scope.id = $routeParams.id;
		
		$scope.initiation = function() {
			$scope.getSubscribeUser();
			$scope.getInvoiceSchedule();
		}
		
		$scope.getSubscribeUser = function() {
			$http.get("${pageContext.request.contextPath}/subscribe/get_subscribe_user/" + $scope.id)
			.then(function(response) {
				$scope.user = response.data;
				$scope.selectedPlan = $scope.user.plan;
				if ($scope.user.plan == 1){
					$scope.plan = "Daily (RM1/day)";
				}else if  ($scope.user.plan == 2){
					$scope.plan = "Weekly (RM5/Week)";
				}else if ($scope.user.plan == 3){
					$scope.plan = "Monthly (RM15/Month)";
				}
			});
		}
		
		$scope.getInvoiceSchedule = function() {
			$http.get("${pageContext.request.contextPath}/subscribe/get_invoice_schedule/" + $scope.id)
			.then(function(response) {
				$scope.schedules = response.data;
			});
		}
	});
</script>