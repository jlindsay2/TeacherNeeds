class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
    @teachers = @teachers.sort_by {|t| [t.last_name.downcase, t.first_name.downcase]}
  end

  def new
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end
  
  def create
    #render plain: params[:teacher].inspect
    @teacher = Teacher.new(teacher_params)

    @teacher.save
    redirect_to teachers_path
  end

  def update
    @teacher = Teacher.find(params[:id])

    @teacher.update(teacher_params)
    redirect_to teachers_path
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  private
      def teacher_params
        params.require(:teacher).permit(:first_name, :last_name, :room, :comments)
      end

end
