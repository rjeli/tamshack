class CreateAttendEvents < ActiveRecord::Migration
  def change
    create_table :attend_events do |t|
      t.text :description
      t.integer :hours

      t.timestamps null: false
    end
  end
end
