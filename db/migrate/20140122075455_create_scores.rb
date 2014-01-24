class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :num_calls
      t.integer :num_wins
      t.integer :user_id
      t.integer :record
      t.boolean :set_call
      t.boolean :set_win

      t.timestamps
    end
  end
end
