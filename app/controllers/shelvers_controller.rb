class ShelversController < ApplicationController

	def index
		@shelvers = Shelver.select{|shelver| shelver.last_day == nil}.sort_by {|shelver| shelver.last_name }
		@past_shelvers = Shelver.select{|shelver| shelver.last_day != nil}.sort_by {|shelver| shelver.last_name }
		# if (DateTime.now+1.day).cweek == (DateTime.now).cweek + 1
		# 	@week = DateTime.now.cweek + 1
		# else
		# 	@week = DateTime.now.cweek
		# end
		# @year = DateTime.now.strftime("%Y").to_i

		# @start_of_week = (DateTime.commercial(@year, @week, 1)-1.day).strftime("%b %-d, %Y")
		# @end_of_week = DateTime.commercial(@year, @week, 6).strftime("%b %-d, %Y")
	end

	def show
		@shelver = Shelver.find(params[:id])
	end

	def new
		@shelver = Shelver.new
	end

	def create
		@shelver = Shelver.new(shelver_params)
		# @shelver.user = current_user
		if @shelver.save
		  redirect_to @shelver
		else
		  render action: 'new'
		end
	end

	def shelvers_open_modal
		@shelver = Shelver.find(params[:shelver_id])
		respond_to do |format|
			format.js
		end
	end

	private

	def shelver_params
		params.require(:shelver).permit(:first_name, :last_name)
	end

end
