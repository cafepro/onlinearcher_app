class CreateArrows < ActiveRecord::Migration
  def change
    create_table :arrows do |t|
      t.integer :score_id
      t.string :value

      t.timestamps null: false
    end
  end
end
