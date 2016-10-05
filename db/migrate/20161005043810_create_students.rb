class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :register_number
      t.integer :status

      t.timestamps
    end
  end
end
