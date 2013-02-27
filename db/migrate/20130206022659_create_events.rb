class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :due_date
      t.float :worth
      t.float :achieved

      t.timestamps
    end
  end
end
