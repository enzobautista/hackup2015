class AddDetailsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :goal, :decimal
    add_column :projects, :stage_id, :integer
    add_column :projects, :average_rating, :integer
  end
end
