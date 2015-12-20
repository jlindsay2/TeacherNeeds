class TeacherReference < ActiveRecord::Migration
  def change
    add_reference :teacher_needs, :teacher, index: true
    #add_foreign_key :teacher_needs, :teacher
  end
end
