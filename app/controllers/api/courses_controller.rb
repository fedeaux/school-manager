class Api::CoursesController < Api::ApiBase
  before_action :set_course, only: [:show, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def update
    @course.update course_params
    render :show
  end

  def create
    @course = Course.create course_params
    render :show
  end

  def destroy
    @course.destroy
    render :show
  end

  private
  def course_params
    params.require(:course).permit(:name, :description, :status)
  end

  def set_course
    @course = Course.find params[:id]
  end
end
