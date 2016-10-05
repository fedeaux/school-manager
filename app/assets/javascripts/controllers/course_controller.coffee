class CourseController
  constructor: (@scope, @stateParams, @Course, @Student, @CoursesService, @CourseStudentsService) ->
    window.course_ctrl = @
    @course_id = @stateParams.id
    @new_student_id = null

    @service = new @CoursesService
    @course_students_service = new @CourseStudentsService @course_id
    @loadCourse()
    @loadStudents()

  loadCourse: ->
    @service.get @course_id, @setCourse

  loadStudents: ->
    @course_students_service.index @setStudents

  setCourse: (response) =>
    @course = new @Course response.course

  setStudents: (response) =>
    @students = {}

    if response.students
      for student_attributes in response.students
        @setStudent student_attributes

    @updateAuxiliarDataStructures()

  updateAuxiliarDataStructures: ->
    @displayable_students = (student for id, student of @students)

  setStudent: (student_attributes) ->
    @students[student_attributes.id] = new @Student student_attributes

  addStudent: ->
    @course_students_service.addStudent @new_student_id, @studentAdded

  removeStudent: (student) ->
    if confirm('This will remove this student from this course. Are you sure?')
      @course_students_service.removeStudent student.id, @studentRemoved

  studentAdded: (response) =>
    @setStudent response.student
    @updateAuxiliarDataStructures()

  studentRemoved: (response) =>
    delete @students[response.student.id]
    @updateAuxiliarDataStructures()

CourseController.$inject = ['$scope', '$stateParams', 'Course', 'Student', 'CoursesService', 'CourseStudentsService']
angular.module('SchoolManagerApp').controller 'CourseController', CourseController
