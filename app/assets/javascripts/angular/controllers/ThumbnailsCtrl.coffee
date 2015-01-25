@thumbnailer.controller 'ThumbnailsCtrl', ['$scope', '$sce', 'Thumbnail', ($scope, $sce, Thumbnail) ->

  $scope.url    = "https://www.youtube.com/watch?v=0XFudmaObLI"
  $scope.images = []
  $scope.videos = []

  $scope.display_caption = (image)->
    image.type and image.size.length is 2

  $scope.html_safe = (html)->
    $sce.trustAsHtml(html)

  $scope.submit = ->
    on_success = (response)->
      $scope.title       = response.title
      $scope.favicon     = response.favicon
      $scope.description = response.description
      $scope.images      = response.images
      $scope.videos      = response.videos

    on_error = ->

    Thumbnail.new(url: $scope.url, on_success, on_error)
]
