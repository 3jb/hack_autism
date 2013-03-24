class AddRIdToResponse < ActiveRecord::Migration
  def self.up
    add_column :responses, :r_id, :integer
  end

  def self.down
    remove_column :responses, :r_id
  end
end
