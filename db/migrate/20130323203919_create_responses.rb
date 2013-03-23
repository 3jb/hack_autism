class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.integer :quality
      t.string :sayit
      t.integer :next_state
      t.integer :current_state

      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
