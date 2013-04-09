class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.references :event
      t.references :user

      t.timestamps
    end
    add_index :user_events, :event_id
    add_index :user_events, :user_id
  end
end
