class AddActualRoundToScores < ActiveRecord::Migration
  def change
    add_column :scores, :actual_round, :integer, default: 1
  end
end
