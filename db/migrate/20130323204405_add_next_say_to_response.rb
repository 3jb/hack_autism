class AddNextSayToResponse < ActiveRecord::Migration
  def self.up
  	add_column :responses, :next_say, :string
  end

  def self.down
  	remove_column :responses, :next_say
  end
end
