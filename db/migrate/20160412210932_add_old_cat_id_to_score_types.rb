class AddOldCatIdToScoreTypes < ActiveRecord::Migration
  def change
    add_column :score_types, :old_type_id, :integer
  end
end
