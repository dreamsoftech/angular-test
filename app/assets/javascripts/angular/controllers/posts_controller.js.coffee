angular.module("testApp").controller "PostCtrl", ($scope, $timeout, $routeParams, Post) ->
  $scope.posts = []
  $scope.post = {}

  $scope.categories =
    business: "Business"
    education: "Education"
    art: "Art"

  # Init initializes Posts.
  # Retrieve resources from Rails.
  # RESTful url api/posts
  $scope.init = ->
    @postFactory = new Post(serviceErrorHandler)
    $scope.getPosts()

  # api/posts.json
  $scope.getPosts = ->
    $scope.posts = @postFactory.all(); 
  
  # DELETE api/posts/:id
  $scope.deletePost = (post) ->
    @postFactory.destroy post
    $scope.posts.splice post.id, 1

  # CREATE api/posts/:id
  $scope.getPost = (post) ->
    @postFactory.get post
    $scope.getPosts()

  # PUT api/posts/:id
  $scope.updatePost = (post) ->
    @postFactory.update post

  $scope.createPost = ->
    $scope.post = @postFactory.create $scope.post
  
  # show edit post modal dialog
  # when user clicks the edit button in list page, trigger this action
  $scope.editPost = (post) ->
    $scope.post = post
    $("#edit-post").modal("show")
    return


  $scope.update = ->
    if !$scope.post.id
      $scope.createPost()
    else
      $scope.updatePost($scope.post)

  serviceErrorHandler = ->
      alert("Error")