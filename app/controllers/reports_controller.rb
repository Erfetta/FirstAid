class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = 123456 # Imposta manualmente l'ID dell'utente se necessario

    if @report.save
      redirect_to @report, notice: 'Report was successfully created.'
    else
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:report_time, :report_date, :coordinates, :user_id)
  end
end
