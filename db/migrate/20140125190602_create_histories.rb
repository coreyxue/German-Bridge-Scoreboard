class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.date :on
      t.boolean :end
      t.timestamps
    end
  end
end
