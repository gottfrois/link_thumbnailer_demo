@thumbnailer = angular.module('thumbnailer', ['ngRoute', 'ngResource', 'ngSanitize', 'templates', 'ui.bootstrap'])

@thumbnailer.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    otherwise({
      templateUrl: 'thumbnails/new.html',
      controller: 'ThumbnailsCtrl'
    })
])
