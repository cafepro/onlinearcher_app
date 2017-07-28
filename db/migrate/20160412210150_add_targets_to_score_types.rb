class AddTargetsToScoreTypes < ActiveRecord::Migration
  def change
    add_column :score_types, :target_1, :string
    add_column :score_types, :target_2, :string
    add_column :score_types, :target_3, :string
    add_column :score_types, :target_4, :string
  end
end
