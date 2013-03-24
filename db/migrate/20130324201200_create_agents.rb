class CreateAgents < ActiveRecord::Migration
  def self.up
    create_table :agents do |t|
      t.string :name
      t.integer :agent_id
      t.integer :state
      t.string :emotion
      t.string :agent_text

      t.timestamps
    end
  end

  def self.down
    drop_table :agents
  end
end
