class LibraryHoursController < ApplicationController

	def index
		@hours = LibraryHour.last

		# if (DateTime.now+1.day).cweek == (DateTime.now).cweek + 1
		# 	@week = DateTime.now.cweek + 1
		# else
		# 	@week = DateTime.now.cweek
		# end
		# @year = DateTime.now.strftime("%Y").to_i

		# @start_of_week = (DateTime.commercial(@year, @week, 1)-1.day).strftime("%b %-d, %Y")
		# @end_of_week = DateTime.commercial(@year, @week, 6).strftime("%b %-d, %Y")
	end

end
