class AddUserIdToCourses < ActiveRecord::Migration
  def change
  	remove_column :courses, :school
  end
end
