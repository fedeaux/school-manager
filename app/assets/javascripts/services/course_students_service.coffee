angular.module('SchoolManagerApp').factory 'CourseStudentsService', ($resource, $http) ->
  class CourseStudentsService
    constructor: (@course_id, @onError = (->)) ->
      @url = "api/courses/#{@course_id}/students/:student_id"

      @service = $resource("#{config.api_url}#{@url}")

    index: (success) ->
      new @service().$get @success success

    addStudent: (student_id, success) ->
      new @service( student_id: student_id ).$save { student_id: student_id }, @success success

    removeStudent: (student_id, success) ->
      new @service().$delete { student_id: student_id }, @success(success), @onError

    success: (success) ->
      (response) ->
        if success
          success response
