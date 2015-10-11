class AddSeenToAttendEvent < ActiveRecord::Migration
  def change
    add_column :attend_events, :seen, :boolean
  end
end
