class AddGoalsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :goals, id: :uuid do |t|
      t.integer :state, null: false
      t.decimal :money_saved, precision: 10, scale: 2
      t.timestamps
    end
  end
end
