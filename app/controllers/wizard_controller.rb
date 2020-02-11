class WizardController < ApplicationController

	def index
		@shelvers = Shelver.select {|shelver| shelver.last_day == nil}.sort_by{|shelver| shelver.last_name}
	end

end
