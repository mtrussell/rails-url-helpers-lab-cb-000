class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def activate
    @student = set_student
    @student.active = !@student.active
    @student.save
    redirect_to student_path(@student)
  end

  def show
    @student = set_student
    if @student.active
      @is_active = "active"
    else
      @is_active = "inactive"
    end
  end


  private

    def set_student
      @student = Student.find(params[:id])
    end
end
