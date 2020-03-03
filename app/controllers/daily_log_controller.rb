class DailyLogController < ApplicationController
	respond_to :html, :json

	def create
	    @daily_log = DailyLog.new(dl_params)
	    if @daily_log.save
	      redirect_to @daily_log
	    end
	end

	def new
		@shelver = Shelver.find(params[:shelver_id])
		respond_to do |format|
			format.html
			format.js
		end
  	end

	def create
		@shelver = Shelver.find(params[:shelver_id])
	end

	# private

	# def dl_params
	# 	params.require(:daily_log).permit(
	# 		:email, :shelf_reading, :department, 
	# 		:daily_tasks, :cleanup, :cleanup_early, 
	# 		:cleanup_done, :carts_sorted, :year, 
	# 		:week_number, :day_number, :shelver
	# 	)
	# end

end
