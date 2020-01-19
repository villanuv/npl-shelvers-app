class Clerk < ActiveRecord::Base
	has_many :schedules
	has_many :cart_contents
end
