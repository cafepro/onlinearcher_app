class AddArrowToArrows < ActiveRecord::Migration
  def change
  	remove_column :arrows, :value
  	add_column :arrows, :value, :integer
    add_column :arrows, :arrow, :string
  end
end
