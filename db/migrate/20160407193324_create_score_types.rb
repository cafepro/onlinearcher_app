class CreateScoreTypes < ActiveRecord::Migration
  def change
    create_table :score_types do |t|
      t.integer :score_id
      t.string :name
      t.integer :arrows
      t.integer :distance_1
      t.integer :distance_2
      t.integer :distance_3
      t.integer :distance_4
      t.boolean :published

      t.timestamps null: false
    end
  end
end
