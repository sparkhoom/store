class AddNameToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :name, :null =>false, :default => ""
    end

    add_index  :users, :name, :unique => true
  end

  def self.down
    remove_column :users, :name
  end
end
