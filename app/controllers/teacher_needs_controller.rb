class TeacherNeedsController < ApplicationController
  def index
    @teacher_needs = TeacherNeed.all
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @teacher_need = @teacher.teacher_needs.create(teacher_needs_params)

    redirect_to teacher_path(@teacher)
  end

  private #############################################################################################
  def teacher_needs_params
    params.require(:teacher_need).permit(:description, :status, :comments)
  end
end

