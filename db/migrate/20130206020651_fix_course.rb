class FixCourse < ActiveRecord::Migration
  def up
  	change_column :courses, :name, :string
  end

  def down
  	change_column :courses, :name, :string
  end
end
