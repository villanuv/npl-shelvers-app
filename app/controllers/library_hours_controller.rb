class LibraryHoursController < ApplicationController

	def index
		if LibraryHour.find_by_week_number(@week) != nil
			@hours = LibraryHour.find_by_week_number(@week)
		else
			@hours = LibraryHour.first
		end
	end

end
