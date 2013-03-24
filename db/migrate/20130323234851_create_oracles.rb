class CreateOracles < ActiveRecord::Migration
  def self.up
    create_table :oracles do |t|
      t.integer :resp_id
      t.string :advice

      t.timestamps
    end
  end

  def self.down
    drop_table :oracles
  end
end
