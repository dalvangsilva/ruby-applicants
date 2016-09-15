class Webmotors
	include Sidekiq::Worker
	def perform
		s = Redis::Semaphore.new(:webmotorsmakers, :host => "localhost")
		s.lock do	
			Webmotorsmakers.fetch.each do |make|
					Webmotorsmodels.fetch make["Id"]
			end
		end
	end
end