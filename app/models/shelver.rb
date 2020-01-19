class Shelver < ActiveRecord::Base
	has_many :schedules
	has_many :daily_logs
	has_many :cart_contents
end
