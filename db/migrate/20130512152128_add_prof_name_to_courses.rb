class AddProfNameToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :prof_name, :string

  end
end
