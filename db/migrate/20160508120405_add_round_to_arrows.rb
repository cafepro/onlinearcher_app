class AddRoundToArrows < ActiveRecord::Migration
  def change
    add_column :arrows, :round, :integer, defaul: 1
  end
end
