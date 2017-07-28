class ScoreType < ActiveRecord::Base
	has_many :scores

	validates :name, :arrows, :color, presence: true;

	scope :published, -> { where(published: true) }

	def self.import_old_cats
		TipoTirada.all.each do |tt|
			self.where( name: tt.nombre, 
						arrows: tt.numflechas, 
						distance_1: tt.dist1, 
						distance_2: tt.dist2, 
						distance_3: tt.dist3,
						distance_4: tt.dist4,
						target_1: tt.dia1,
						target_2: tt.dia2,
						target_3: tt.dia3,
						target_4: tt.dia4,
						old_type_id: tt.id).first_or_create
		end
	end
end
