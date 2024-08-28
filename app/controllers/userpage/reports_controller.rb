module Userpage
  class ReportsController < ApplicationController
    def new
      @report = Report.new
    end

    def create
      @report = Report.new(report_params)
      if @report.save
        redirect_to userpage_root_path, notice: 'Report was successfully created.'
      else
        Rails.logger.debug @report.errors.full_messages # <-- Questo mostrerà gli errori nel log
        render :new
      end
    end

    private

    def report_params
      params.require(:report).permit(:report_time, :report_date, :coordinates, :user_id)
    end
  end
end
