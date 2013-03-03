class AddingIdBackToCourses < ActiveRecord::Migration
  def up
	add_column :courses, :id, :primary_key
  end

  def down
	remove_column :courses, :id
  end
end
