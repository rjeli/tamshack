class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.references :creator, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
