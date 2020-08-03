@thumbnailer.controller 'ThumbnailsCtrl', ['$scope', '$http', '$sce', ($scope, $http, $sce) ->

  $scope.url    = "https://www.youtube.com/watch?v=0XFudmaObLI"
  $scope.images = []
  $scope.videos = []

  $scope.display_caption = (image)->
    image.type and image.size.length is 2

  $scope.html_safe = (html)->
    $sce.trustAsHtml(html)

  $scope.submit = ->
    $http.post(
      $sce.trustAsResourceUrl("https://link-thumbnailer-demo.herokuapp.com/thumbnails/"),
      "",
      params:
        url: $scope.url
    )
    .then (response)->
      $scope.title       = response.data.title
      $scope.favicon     = response.data.favicon
      $scope.description = response.data.description
      $scope.images      = response.data.images
      $scope.videos      = response.data.videos
    .catch (error)->
      console.log error
]
