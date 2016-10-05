angular.module('<%= ng_app_name %>').factory '<%= service_name %>', ($resource, $http) ->
  class <%= service_name %>
    constructor: (@onError = (->)) ->
      @url = "<%= underscore_plural_name %>/:id"

      @service = $resource("#{config.api_url}#{@url}", {}, {
       'update': { method: 'PUT'}
      })

    create: (<%= underscore_singular_name %>, success) ->
      new @service(<%= underscore_singular_name %>: <%= underscore_singular_name %>.attributes()).$save @success(success), @onError

    update: (<%= underscore_singular_name %>, success) ->
      new @service(<%= underscore_singular_name %>: <%= underscore_singular_name %>.attributes()).$update { id: <%= underscore_singular_name %>.id }, @success(success), @onError

    delete: (<%= underscore_singular_name %>, success) ->
      new @service().$delete {id: <%= underscore_singular_name %>.id}, @success(success), @onError

    index: (success) ->
      new @service().$get @success success

    get: (<%= underscore_singular_name %>_id, success) ->
      new @service().$get id: <%= underscore_singular_name %>_id, @success success

    success: (success) ->
      (response) ->
        if success
          success response
