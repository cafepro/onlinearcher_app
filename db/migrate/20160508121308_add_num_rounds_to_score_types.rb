class AddNumRoundsToScoreTypes < ActiveRecord::Migration
  def change
    add_column :score_types, :num_rounds, :integer
  end
end
