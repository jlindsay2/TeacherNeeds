class CreateTeacherNeeds < ActiveRecord::Migration
  def change
    create_table :teacher_needs do |t|
      t.string      :description
      t.string      :status
      t.text        :comments
      t.timestamps
    end
  end
end
