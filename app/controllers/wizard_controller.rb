class WizardController < ApplicationController
	require 'csv'

	def index
		@shelvers = Shelver.select {|shelver| shelver.last_day == nil}.sort_by{|shelver| shelver.last_name}
	end

	def import
		data = []
		@shelvers = []
		all_shelvers_names = Shelver.select {|shelver| shelver.last_day == nil}.map {|shelver| "#{shelver.first_name} #{shelver.last_name}"}

		myfile = params[:file].path
		CSV.foreach(myfile) do |row|
			if row[2] == "Circ"
				shelver = Hash.new
				shelver["first_name"] = "#{row[1]}"
				shelver["last_name"] = "#{row[0]}"
				shelver["hours"] = [row[3], row[4], row[5], row[6], row[7], row[8], row[9]]
				data << shelver
			end
		end
		
		all_shelvers_names.each do |shelver|
			@shelvers << data.select{|hash| hash if "#{hash['first_name']} #{hash['last_name']}" == shelver}[0]
		end

		@shelvers.each {|shelver| shelver["shelver_id"] = Shelver.find_by(first_name: shelver["first_name"], last_name: shelver["last_name"]).id }
		@shelvers.sort_by!{|shelver| shelver["last_name"]}
	end

end
