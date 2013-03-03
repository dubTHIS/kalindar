class RemoveIdFromCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :id
      end

  def down
    add_column :courses, :id, :string
  end
end
