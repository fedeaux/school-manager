angular.module('SchoolManagerApp')
.config ($stateProvider) ->
  $stateProvider.state('courses',
    url: ''
    views:
      dashboard:
        templateUrl: '/templates/courses/index'
        controller: 'CoursesController as courses_ctrl'

  ).state('app.with_slash',
    url: '/'
  ).state('course',
    url: '/courses/:id'
    views:
      dashboard:
        templateUrl: '/templates/courses/show'
        controller: 'CourseController as course_ctrl'

  ).state('students',
    url: '/students'
    views:
      dashboard:
        templateUrl: '/templates/students/index'
        controller: 'StudentsController as students_ctrl'
  )
