class CreateBackings < ActiveRecord::Migration
  def change
    create_table :backings do |t|
      t.integer :project_id
      t.integer :user_id
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
