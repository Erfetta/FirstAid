class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def create
    puts "ciao porco dioooooooooooooooooooooooooooooooooooooooooooooooooo|||||||||||||||||||||||||||||||||||||||"
    
    @report = Report.new(report_params)
  
    if @report.save
      redirect_to @report, notice: 'Report was successfully created.'
    else
      puts @report.errors.full_messages
      render :new
    end
  end

  def show
    @report = Report.find(params[:id])
  end
  
  private

  def report_params
    params.require(:report).permit(:report_time, :report_date, :coordinates, :user_id)
  end
end
