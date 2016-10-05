class StudentsController
  constructor: (@scope, @state, @Student, @StudentsService) ->
    window.ctrl = @
    @service = new @StudentsService
    @form_student = null

    @loadStudents()

  loadStudents: ->
    @service.index @setStudents

  setStudents: (response) =>
    @students = {}

    if response.students
      for student_attributes in response.students
        @setStudent student_attributes

      @updateAuxiliarDataStructures()

  studentUpdated: (response) =>
    @setStudent response.student
    @clearFormStudent()
    @updateAuxiliarDataStructures()

  setStudent: (student_attributes) =>
    @students[student_attributes.id] = new @Student student_attributes

  updateAuxiliarDataStructures: =>
    @displayable_students = (student for id, student of @students)

  setFormStudent: (student, form) ->
    if student and student.isPersisted()
      @original_form_student = angular.copy student

    @form_student = student
    form.$setPristine() if form

  setBlankFormStudent: (form) ->
    @setFormStudent (new @Student), form

  cancelStudentEdit: (form) ->
    if @original_form_student
      @students[@original_form_student.id] = @original_form_student
      @updateAuxiliarDataStructures()

    @clearFormStudent form

  clearFormStudent: (form) ->
    @original_form_student = null
    @setFormStudent null, form

  saveFormStudent: (form) =>
    if form.$valid
      form.$setPristine()
      if @form_student.isPersisted()
        @service.update @form_student, @studentUpdated
      else
        @service.create @form_student, @studentUpdated

StudentsController.$inject = ['$scope', '$state', 'Student', 'StudentsService']
angular.module('SchoolManagerApp').controller 'StudentsController', StudentsController
