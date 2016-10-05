class Api::CourseStudentsController < Api::ApiBase
  before_action :set_course

  def index
    @students = @course.students
    render 'api/students/index'
  end

  private
  def set_course
    @course = Course.find params[:course_id]
  end
end
