class Usuario < ActiveRecord::Base

	has_many :sesiones, :foreign_key => "usuario"#, :class_name => "Sesion"

end
