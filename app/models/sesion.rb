class Sesion < ActiveRecord::Base

	belongs_to :usuario, :foreign_key => "usuario"
	has_many :rondas, :foreign_key => "sesion"

end