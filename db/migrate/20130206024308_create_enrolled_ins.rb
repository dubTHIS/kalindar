class CreateEnrolledIns < ActiveRecord::Migration
  def change
    create_table :enrolled_ins do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
