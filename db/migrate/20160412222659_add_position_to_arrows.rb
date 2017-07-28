class AddPositionToArrows < ActiveRecord::Migration
  def change
    add_column :arrows, :position, :integer
  end
end
