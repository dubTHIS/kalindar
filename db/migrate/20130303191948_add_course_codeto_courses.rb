class AddCourseCodetoCourses < ActiveRecord::Migration
  def up
	add_column :courses, :course_code, :string
  end

  def down
	remove_column :courses, :course_code
  end
end
