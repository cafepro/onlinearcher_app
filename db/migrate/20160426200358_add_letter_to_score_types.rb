class AddLetterToScoreTypes < ActiveRecord::Migration
  def change
    add_column :score_types, :letter, :string, default: 'F'
  end
end
