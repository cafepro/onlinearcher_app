class ChangeColumnSesionFromRondas < ActiveRecord::Migration
  def change
  	#change_column :rondas, :sesion, :integer
  	#change_column :rondas, :ronda, :integer
  	#change_column :rondas, :distancia, :integer
  	execute "ALTER TABLE `rondas` DROP PRIMARY KEY;"
  end
end
