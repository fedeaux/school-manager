class CreateClassRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :class_rooms do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :course, foreign_key: true
      t.datetime :entry_at

      t.timestamps
    end
  end
end
