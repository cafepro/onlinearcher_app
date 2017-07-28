class Arrow < ActiveRecord::Base
	belongs_to :score
	validates :score_id, :value, :arrow, presence: true

	before_create :do_create_tasks

	default_scope { order('position ASC') } 

	private
		def do_create_tasks
			# establecemos la posición
			self.position = (Arrow.where(score_id: self.score_id).where.not(id: self.score_id).last.position)+1 rescue 1
		end

	public
		def self.get_arrow_value arrow 
			return 10 if arrow == 'X'
			return 0 if arrow == 'M'
			return arrow.to_i
		end
end
