'use strict';

angular.module('myApp.view1', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/view1', {
    templateUrl: 'view1/view1.html',
    controller: 'View1Ctrl'
  });
}])


  .controller('View1Ctrl', ['$scope', '$http', function($scope, $http) {
    $scope.students=[];

    $http.get('/students.json').success(function(data){
      $scope.students= data
    });
 // $scope.students = [{name: "Tony Stark", surname: "Iron Man"},{name: "Tony", surname: "Man"}]

}]);



//controller('BoutiqueCtrl', function($scope, $http){
  //  $scope.articles=[];
    //$scope.listeArticles=[];

 //   $http.get('json/articles.json').success(function(data){
   //   $scope.articles= data
   // });

   // $scope.selectArticles = function(article){

    //}

//  })