angular.module("testApp").factory "Post", ($resource, $http) ->
  factory = (->
    Post = (errorHandler) ->
      defaults = undefined
      @service = $resource("/api/posts/:id",
        id: "@id"
      ,
        update:
          method: "PATCH"
      )
      @errorHandler = errorHandler
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch or {}
      defaults.patch["Content-Type"] = "application/json"
      return
    
    Post::create = (attrs) ->
      new @service(Post: attrs).$save ((Post) ->
        attrs.id = Post.id
      ), @errorHandler
      attrs

    Post::destroy = (post) ->
      new @service().$delete
        id: post.id
      , (->
        null
      ), @errorHandler

    Post::update = (post) ->
      new @service(post: post).$update
        id: post.id
      , (->
        null
      ), @errorHandler

    Post::all = ->
      @service.query (->
        null
      ), @errorHandler

    Post
  )()
  factory