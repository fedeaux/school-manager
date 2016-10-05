class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    drop_table :class_rooms
    create_table :classrooms do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
