class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :project_id
      t.text :details
      t.string :title
      t.decimal :minimum_amount

      t.timestamps null: false
    end
  end
end
