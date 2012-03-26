class CreateNewsieTables < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string   :name
      t.datetime :start_date
      t.datetime :end_date
      t.text     :content
      t.boolean  :dismiss
      t.timestamps
    end
  end
  
  def self.down
    drop_table :events
  end
end
