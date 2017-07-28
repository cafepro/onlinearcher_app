class AddRoundToScoreType < ActiveRecord::Migration
  def change
    add_column :score_types, :round, :integer, default: 6
    add_column :score_types, :color, :string, default: '#0091EA'
  end
end
