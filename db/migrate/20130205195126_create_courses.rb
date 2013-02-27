class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :id
      t.string :school

      t.timestamps
    end
    add_index :courses, :id, :unique => true
  end
end
