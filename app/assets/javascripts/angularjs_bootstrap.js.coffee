testApp = angular.module("testApp", [
  "ngRoute"
  "ngResource"
  "templates"
])
testApp.config ($httpProvider, $routeProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

  $routeProvider.when("/",
      templateUrl: "index.html"
      controller: "PostCtrl"
    ).when "/posts",
      templateUrl: "posts.html"
      controller: "PostCtrl"
    .when "/form",
      templateUrl: "form.html"
      controller: "PostCtrl"