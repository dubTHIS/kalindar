class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :body
      t.text :c_name
      t.text :c_desc
      t.integer :c_id
      t.text :c_school

      t.timestamps
    end
  end
end
