class Ronda < ActiveRecord::Base

	belongs_to :sesion, foreign_key: "sesion"
end