class Schedule < ActiveRecord::Base
  belongs_to :shelver
  belongs_to :clerk

  def total_hours
  	hour_string = "#{sun} #{mon} #{tue} #{wed} #{thu} #{fri} #{sat}"
  	hours_array = hour_string.squish.gsub(/(\(\d\))/, "").split(" ")

  	time_converted = hours_array.map do |hours|
  		shift_hours_array = hours.split("-").map{|hour| hour.to_i}
  		if shift_hours_array[0] > shift_hours_array[1]
  			if shift_hours_array[0].to_s.length > 2
	  			hr24 = shift_hours_array[1].to_i + 1200
	  			"#{shift_hours_array[0]}-#{hr24}"
	  		else
	  			"#{shift_hours_array[0]}-#{shift_hours_array[1]+12}"
	  		end
  		else
  			shift_hours_array.join("-")
  		end
  	end
  	
  	just_hours = time_converted.map{|hours| hours.split("-")[1].to_i-hours.split("-")[0].to_i}
  	filter_just_hours = just_hours.map do |hours_for_day|
  		if hours_for_day > 100
  			hours_for_day / 100
  		else
  			hours_for_day
  		end
  	end
  	
  	max_hours = filter_just_hours.map{|hour| hour >= 8 ? hour - 1 : hour}
  	return max_hours.inject(:+)
  end
end
