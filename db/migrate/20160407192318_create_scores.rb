class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :name
      t.integer :score_type_id
      t.integer :user_id
      t.integer :state
      t.integer :published
      t.integer :points
      t.float :average
      t.integer :x_count
      t.integer :ten_count
      t.integer :nine_count

      t.timestamps null: false
    end
  end
end
