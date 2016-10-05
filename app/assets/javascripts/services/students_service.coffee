angular.module('SchoolManagerApp').factory 'StudentsService', ($resource, $http) ->
  class StudentsService
    constructor: (@onError = (->)) ->
      @url = "students/:id"

      @service = $resource("#{config.api_url}#{@url}", {}, {
       'update': { method: 'PUT'}
      })

    create: (student, success) ->
      new @service(student: student.attributes()).$save @success(success), @onError

    update: (student, success) ->
      new @service(student: student.attributes()).$update { id: student.id }, @success(success), @onError

    delete: (student, success) ->
      new @service().$delete {id: student.id}, @success(success), @onError

    index: (success) ->
      new @service().$get @success success

    get: (student_id, success) ->
      new @service().$get id: student_id, @success success

    success: (success) ->
      (response) ->
        if success
          success response
