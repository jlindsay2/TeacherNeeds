FILLED = 'Filled'
ACTIVE = 'Active'
CLOSED = 'Closed'

class TeacherNeedsController < ApplicationController
  $debugging = []
  def index
    #$debugging << "--------------------->TeacherNeedsController::index() called."
    @teacher_needs = TeacherNeed.all
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @teacher_need = @teacher.teacher_needs.create(teacher_needs_params)

    redirect_to teacher_path(@teacher)
  end

  def update_checked
    #$debugging << "--------------------->TeacherNeedsController::update_checked() called."
    #$debugging << params

    @teacher_needs = TeacherNeed.all
    @teacher_needs.each do |need|
      if params[need.id.to_s] == '1'  # That TeacherNeed was marked as Filled
        #$debugging << "ID #{need.id} was marked FILLED!"
        need.update_column('status', FILLED)
        need.touch # change the updated_at field
      end
    end


    redirect_to teacher_needs_path
    end
=begin
  def update
    @teacher = Teacher.find(params[:id])

    @teacher.update(teacher_params)
    redirect_to teachers_path
  end
=end


  private #############################################################################################
  def teacher_needs_params
    params.require(:teacher_need).permit(:description, :status, :comments)
  end
end

