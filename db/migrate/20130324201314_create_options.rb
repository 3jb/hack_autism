class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.string :text
      t.integer :next_state
      t.string :agent_text
      t.string :agent_emotion
      t.string :oracle_text

      t.timestamps
    end
  end

  def self.down
    drop_table :options
  end
end
