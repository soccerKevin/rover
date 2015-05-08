(function(){
	var app = angular.module('rover', []);

	app.config(['$httpProvider', function($httpProvider){
    $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
  }]);

  app.controller('StaysController', ['$http', '$scope', function($http, $scope){
  	$scope.stays = [];

  	$http.get('/stays')
  		.success(function(data){
  			$scope.stays = data;
  		})
  		.error(function(){

  		});
  }]);
})()
