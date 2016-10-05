class Api::CourseStudentsController < Api::ApiBase
  before_action :set_course
  before_action :set_student, only: [:create]

  def index
    @students = @course.students
    render 'api/students/index'
  end

  def create
    if @student.courses.include? @course
      head(422)
    else
      Classroom.create student: @student, course: @course
      render 'api/students/show'
    end
  end

  private
  def set_course
    @course = Course.find params[:course_id]
  end

  def set_student
    @student = Student.find params[:student_id]
  end
end
