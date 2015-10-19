class AddCurrentAmountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :current_amount, :decimal
  end
end
