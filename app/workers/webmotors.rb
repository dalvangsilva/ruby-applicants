class Webmotors
	include Sidekiq::Worker
	def perform
		Webmotorsmakers.fetch.each do |make|
				Webmotorsmodels.fetch make["Id"]
		end
	end
end