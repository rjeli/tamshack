class AddApprovedToAttendEvent < ActiveRecord::Migration
  def change
    add_column :attend_events, :approved, :boolean
  end
end
