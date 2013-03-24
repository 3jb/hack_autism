class AddSIdToState < ActiveRecord::Migration
  def self.up
    add_column :states, :s_id, :integer
  end

  def self.down
    remove_column :states, :s_id
  end
end
