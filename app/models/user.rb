class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :scores

  before_create :set_default_rol

  def has_role? rol
  	return self.get_roles.include? rol.to_s
  end

  def get_roles
    return self.roles.split(',')
  end


  private
  	def set_default_rol
  		self.roles = 'user' if self.roles.blank?
  	end
end
