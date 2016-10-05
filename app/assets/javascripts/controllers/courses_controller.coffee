class CoursesController
  constructor: (@scope, @state, @Course, @CoursesService) ->
    window.ctrl = @
    @service = new @CoursesService
    @form_course = null

    @loadCourses()

  loadCourses: ->
    @service.index @setCourses

  setCourses: (response) =>
    @courses = {}

    if response.courses
      for course_attributes in response.courses
        @setCourse course_attributes

      @updateAuxiliarDataStructures()

  courseUpdated: (response) =>
    @setCourse response.course
    @clearFormCourse()
    @updateAuxiliarDataStructures()

  setCourse: (course_attributes) =>
    @courses[course_attributes.id] = new @Course course_attributes

  updateAuxiliarDataStructures: =>
    @displayable_courses = (course for id, course of @courses)

  setFormCourse: (course, form) ->
    if course and course.isPersisted()
      @original_form_course = angular.copy course

    @form_course = course
    form.$setPristine() if form

  setBlankFormCourse: (form) ->
    @setFormCourse (new @Course), form

  cancelCourseEdit: (form) ->
    if @original_form_course
      @courses[@original_form_course.id] = @original_form_course
      @updateAuxiliarDataStructures()

    @clearFormCourse form

  clearFormCourse: (form) ->
    @original_form_course = null
    @setFormCourse null, form

  saveFormCourse: (form) =>
    if form.$valid
      form.$setPristine()
      if @form_course.isPersisted()
        @service.update @form_course, @courseUpdated
      else
        @service.create @form_course, @courseUpdated

CoursesController.$inject = ['$scope', '$state', 'Course', 'CoursesService']
angular.module('SchoolManagerApp').controller 'CoursesController', CoursesController
