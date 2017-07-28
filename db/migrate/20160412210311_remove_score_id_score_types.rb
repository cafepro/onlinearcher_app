class RemoveScoreIdScoreTypes < ActiveRecord::Migration
  def change
  	remove_column :score_types, :score_id
  end
end
