@thumbnailer.factory 'Thumbnail', ['$resource', ($resource) ->

  service = $resource "http://link-thumbnailer-api.herokuapp.com/thumbnails/:action", { action: '@action' },
    new: { method: 'JSONP', params: { action: 'new', callback: 'JSON_CALLBACK' } }

  factory =
    new: (args, on_success, on_error)->
      service.new(args, on_success, on_error)

  factory
]
