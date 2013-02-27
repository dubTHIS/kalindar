class FixEvents < ActiveRecord::Migration
  def up
  	add_column :events, :course_id, :integer
  end

  def down
  	add_column :events, :course_id, :integer
  end
end
