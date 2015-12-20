# Initial fields: name, room, and comments
class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string      :name
      t.string      :room
      t.text        :comments
      t.timestamps
    end
  end
end
