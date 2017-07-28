class AddIdToRondas < ActiveRecord::Migration
  def change
    add_column :rondas, :id, :primary_key
  end
end
