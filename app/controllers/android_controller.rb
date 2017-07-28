class AndroidController < ActionController::Base
	skip_before_action :verify_authenticity_token
	before_filter :check_user

	respond_to :json

	def acceso
		if @user.blank?
			logger.fatal "{logstatus: 0}"
			render json: [{logstatus: 0}] and return
		else
			@user.id = @user.id.to_i
			logger.fatal @user.as_json
			render json: [{logstatus: 1}.merge(@user.as_json)] and return
		end
	end

	def getsesiones
		render json: [{logstatus: 0}] and return if @user.blank?
		# obtenemos las sesiones
		sesiones = @user.sesiones.select(:id, :nombre, :modalidad, :fecha, :hora, :puntuacion, :media, :comentarios, :tipotirada, :public, :competicion)
		sesiones = sesiones.where.not(id: params[:ids])
		sesiones.order(:id)
		# creamos la futura respuesta
		response = [{logstatus: 1, numero: sesiones.size}]
		sesiones.each do |sesion|
			aux = []
			rondas = sesion.rondas.select(:ronda, :distancia, :flecha1, :flecha2, :flecha3).order(:distancia, :ronda)
			rondas.each do |ronda|
				aux << ronda
			end
			response << [ sesion: [ sesion.as_json.merge( { rondas: aux } ) ] ]
		end
		logger.fatal response.as_json
		render json: response
	end

	private

		def check_user
			# Parameters: {"usuario"=>"jorgecf@gmail.com", "keyword"=>"40c7e6903a59e5c553280a2618a43d80"}
			logger.fatal '*******************************'
			logger.fatal params
			logger.fatal '*******************************'
			@user = Usuario.select(:id, :nombre, :apellidos, :fechanac, :sexo, :modalidad, :nacional, :regional, :tuestado, :foto, :fechamod).first
			#@user = Usuario.where(mail: params[:usuario], keyword: params[:keyword]).select(:id, :nombre, :apellidos, :fechanac, :sexo, :modalidad, :nacional, :regional, :tuestado, :foto, :fechamod).first
			logger.fatal '*******************************'
		end


end