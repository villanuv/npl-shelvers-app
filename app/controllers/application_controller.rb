class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :authenticate_user!, :set_variables

	def set_variables
		if (DateTime.now+1.day).cweek == (DateTime.now).cweek + 1
			@week = DateTime.now.cweek + 1
		else
			@week = DateTime.now.cweek
		end
		@year = DateTime.now.strftime("%Y").to_i

		@start_of_week = (DateTime.commercial(@year, @week, 1)-1.day).strftime("%b %-d, %Y")
		@end_of_week = DateTime.commercial(@year, @week, 6).strftime("%b %-d, %Y")
	end
end
