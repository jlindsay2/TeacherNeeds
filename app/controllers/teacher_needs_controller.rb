FILLED = 'Delivered'
ACTIVE = 'Active'
CLOSED = 'Closed'

class TeacherNeedsController < ApplicationController
  $debugging = []
  def index
    #$debugging << "--------------------->TeacherNeedsController::index() called."
    #@teachers = Teacher.all.sort_by {|t| [t.last_name.downcase, t.first_name.downcase]}
    @teacher_needs = TeacherNeed.all.sort_by {|t| [t.created_at, t.teacher.last_name.downcase, t.teacher.first_name.downcase ]}
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @teacher_need = @teacher.teacher_needs.create(teacher_needs_params)

    redirect_to teacher_path(@teacher)
  end

  def edit
    @teacher_need = TeacherNeed.find(params[:id])
  end

  def update
    @need = TeacherNeed.find(params[:id])
    @need.update(teacher_needs_params)

    redirect_to teacher_path(@need.teacher_id)
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

  def close
    @need = TeacherNeed.find(params[:id])
    @teacher = Teacher.find(@need.teacher_id)

    @need.update_column('status', CLOSED)
    redirect_to teacher_path(@teacher)
  end

  def reactivate
    @need = TeacherNeed.find(params[:id])
    @teacher = Teacher.find(@need.teacher_id)

    @need.update_column('status', ACTIVE)
    redirect_to teacher_path(@teacher)
  end


  private #############################################################################################
  def teacher_needs_params
    params.require(:teacher_need).permit(:description, :status, :comments)
  end
end

