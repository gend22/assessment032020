<script>
	app.controller('create_subscription_ctrl', function($scope, $http, $routeParams, $window, $location, $route) {
		$scope.plans = [
			  {id : "1", desc : "Daily (RM1/day)"},
			  {id : "2", desc : "Weekly (RM5/Week)"},
			  {id : "3", desc : "Monthly (RM15/Month)"}
		];
		
		$scope.createSubscription = function() {
			$('#loading_modal').modal('show');
			$http.post("${pageContext.request.contextPath}/subscribe/submit", $scope.user)
			.then(function(response) {
				$('#loading_modal').modal('hide');
				$('body').removeClass('modal-open');
				$('.modal-backdrop').remove();
				if (response.data.response_code == "01"){
					location.href="/#!output/"+response.data.userId;
				}else {
					alert("Failed to Subscribe");
				}
			});
		}
	});
</script>