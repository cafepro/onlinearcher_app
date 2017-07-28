class Score < ActiveRecord::Base
	belongs_to :user
	belongs_to :score_type
	has_many   :arrows, dependent: :destroy
	validates :score_type, :name, :user_id, presence: true

	enum state: [:started, :ended, :deleted]

	before_create :do_create_tasks

	scope :published, -> { where(published: true) }
	scope :not_deleted, -> { where.not(state: Score.states[:deleted]) }
	scope :started, -> { where(state: Score.states[:started]) }
	scope :ended, -> { where(state: Score.states[:ended]) }
	scope :deleted, -> { where(state: Score.states[:deleted]) }

	private
		def do_create_tasks
			# marcar como comenzada
			self.state = Score.states[:started]
			# marcar como privada por defecto
			self.published = false
			# establecemos valores iniciales
			self.points = self.x_count = self.ten_count = self.nine_count = 0
    		self.average = 0.0
		end


	public
		def arrows(round=nil)
			return super if round.nil? 
			return super.where(round: round)
		end

		def puntos_ronda_anterior
			self.arrows.unscope(:order).order('position DESC').limit(6).collect(&:value).sum
		end

		def parcial
			return 0
		end

		def ronda
			(self.arrows.count / self.score_type.round).to_i + 1
		end

		def published?
			return I18n.t('score.publish') if self.published 
			return I18n.t('score.unpublish')
		end

end
