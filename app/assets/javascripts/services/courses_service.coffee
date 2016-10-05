angular.module('SchoolManagerApp').factory 'CoursesService', ($resource, $http) ->
  class CoursesService
    constructor: (@onError = (->)) ->
      @url = "api/courses/:id"

      @service = $resource("#{config.api_url}#{@url}", {}, {
       'update': { method: 'PUT'}
      })

    create: (course, success) ->
      new @service(course: course.attributes()).$save @success(success), @onError

    update: (course, success) ->
      new @service(course: course.attributes()).$update { id: course.id }, @success(success), @onError

    delete: (course, success) ->
      new @service().$delete {id: course.id}, @success(success), @onError

    index: (success) ->
      new @service().$get @success success

    get: (course_id, success) ->
      new @service().$get id: course_id, @success success

    success: (success) ->
      (response) ->
        if success
          success response
