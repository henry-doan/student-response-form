class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
  	@student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
  		flash[:success] = "Form Submitted"
  		redirect_to new_student_path
  	else
  		flash[:notice] = "Failed to Submit Form"
  		render :new 
  	end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    render json: { message: 'removed' }, status: :ok
    redirect_to students_path
  end

  private
    def student_params
  		params.require(:student).permit(:name, :question)
  	end
end
