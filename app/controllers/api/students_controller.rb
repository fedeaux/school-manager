class Api::StudentsController < Api::ApiBase
  before_action :set_student, only: [:show, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def update
    @student.update student_params
    render :show
  end

  def create
    @student = Student.create student_params
    render :show
  end

  def destroy
    @student.destroy
    render :show
  end

  private
  def student_params
    params.require(:student).permit(:name, :register_number, :status)
  end

  def set_student
    @student = Student.find params[:id]
  end
end
