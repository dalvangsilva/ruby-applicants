class Webmotorsmodels
	def self.fetch webmotors_make_id
		#search the models
		uri = URI("http://www.webmotors.com.br/carro/modelos")

		# Make request for Webmotors site
    make = Make.where(webmotors_id: webmotors_make_id)[0]
		
		# Make request for Webmotors site
		response = Net::HTTP.post_form(uri, { marca: webmotors_make_id })
		models_json = JSON.parse response.body

		# Itera no resultado e grava os modelos que ainda não estão persistidas
		models_json.each do |json|
			if Model.where(name: json["Nome"], make_id: make.id).size == 0
				Model.create(make_id: make.id, name: json["Nome"])
			end
		end
	end
end