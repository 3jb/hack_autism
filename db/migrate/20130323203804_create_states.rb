class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name
      t.string :toonsay
      t.integer :best_resp
      t.integer :good_resp
      t.integer :bad_resp
      t.integer :worst_resp

      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end
