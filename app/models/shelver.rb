class Shelver < ActiveRecord::Base
	has_many :schedules
	has_many :daily_logs
	has_many :cart_contents
	accepts_nested_attributes_for :daily_logs

	def show_daily_log(year, week, day)
		daily_logs.find_by(year: year, week_number: week, day_number: day)
	end

	def sched_for_day(year, week, day)
		schedules.find_by(year: year, week_number: week).send(day)
	end

	def get_daily_log(shelver_id, year, week, day)
		DailyLog.where(
			shelver_id: shelver_id,
			year: year,
			week_number: week,
			day_number: day
		)[0]
	end
end
