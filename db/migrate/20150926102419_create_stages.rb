class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.integer :project_id
      t.decimal :amount
      t.date :deadline

      t.timestamps null: false
    end
  end
end
