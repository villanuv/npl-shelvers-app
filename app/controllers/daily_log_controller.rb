class DailyLogController < ApplicationController
	respond_to :html, :json

	def index
		@daily_logs = DailyLog.alle
	end

	def create
	    @daily_log = DailyLog.new(dl_params)
	    if @daily_log.save
	      redirect_to root_path
	    end
	end

	def new
		@shelver = Shelver.find(params[:shelver_id])
	    @daily_log = DailyLog.new
		@day = params[:day]
		respond_to do |format|
			format.html
			format.js
		end
  	end

  	def edit
  		@shelver = Shelver.find(params[:shelver].id)
  		@daily_log = DailyLog.find(params[:id])
  	end

	def update
  		@daily_log = DailyLog.find(params[:id])
		if @daily_log.update_attributes(dl_params)
			redirect_to root_path
		else
			redirect_to root_path
		end
	end


	private

	def dl_params
		params.require(:daily_log).permit(
			:email, :shelf_reading, :department, 
			:daily_tasks, :cleanup, :cleanup_early, 
			:cleanup_done, :carts_sorted, :year, 
			:week_number, :day_number, :shelver_id
		)
	end

end
