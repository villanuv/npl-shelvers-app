class WeekController < ApplicationController

	def index
		if params[(:week_number)] == nil
			# wday range: 0..6
			@day = DateTime.now.wday + 1
			get_date(@week, @day, @year)
			set_previous_next_link_variables
		end

		@day_symbol = DateTime.now.strftime("%a").downcase
		@schedules_this_week = Schedule.select{|sched| sched.week_number == @week}
		if @schedules_this_week.count > 0
			@shelvers = Schedule.select{|x| x.send(@day_symbol) != nil && x.week_number == @week}.map{|sched| sched.shelver}.sort_by{|s| s.last_name}
		end
	end


	def show
		if params[(:week_number)].to_i > 0 && params[(:week_number)].to_i < 54 && params[(:day_number)].to_i > 0 && params[(:day_number)].to_i < 8
			@week = params[(:week_number)].to_i
			@day = params[(:day_number)].to_i
			@year = params[(:year)].to_i
			get_date(@week, @day, @year)
			set_previous_next_link_variables_show
		elsif params[(:day_number)].to_i > 7 || params[(:day_number)].to_i < 1 || params[(:week_number)].to_i > 53 || params[(:week_number)].to_i < 1
			redirect_to root_path
		end

		@day_symbol = Date.commercial(@year, @week, @previous_day).strftime("%a").downcase

		@shelvers = Schedule.select{|x| x.send(@day_symbol) != nil && x.week_number == @week}.map{|sched| sched.shelver}.sort_by{|s| s.last_name}
	end


	private

	def get_date(week, day, year)
		if week > 0 && week < 54 && day > -1 && day < 8
			if day == 1
				adj_day = 7
				adj_week = week - 1
			else
				adj_day = day - 1
				adj_week = week
			end
			date_instance = Date.commercial(year, adj_week, adj_day)
			@todays_date = date_instance.strftime("%A, %B #{date_instance.day.ordinalize}, %Y")
		end
	end

	def set_previous_next_link_variables
		if @day == 7
			@next_day = 1
			@next_week = @week + 1
		else
			@next_day = @day + 1
			@next_week = @week
		end

		if @week == 52 && @day == 7
			@next_week = 1
			@next_year = @year + 1
		else
			@next_year = @year
		end

		if @day == 1
			@previous_day = 7
			@previous_week = @week - 1
		else
			@previous_day = @day - 1
			@previous_week = @week
		end

		if @week == 1 && @day == 1
			@previous_week = 52 #bug
			@previous_year = @year - 1
		else
			@previous_year = @year
		end
	end

	def set_previous_next_link_variables_show
		if @day == 7
			@next_day = 1
			@next_week = @week + 1
		else
			@next_day = @day + 1
			@next_week = @week
		end

		if @week == 52 && @day == 7
			@next_week = 1
			@next_year = @year + 1
		else
			@next_year = @year
		end

		if @day == 1
			@previous_day = 7
			@previous_week = @week - 1
		else
			@previous_day = @day - 1
			@previous_week = @week
		end

		if @week == 1 && @day == 1
			@previous_week = 52
			@previous_year = @year - 1
		else
			@previous_year = @year
		end
	end

end
