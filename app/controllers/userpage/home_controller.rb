module Userpage
  class HomeController < ApplicationController
    def user_index
      @users = User.all
      Rails.logger.debug "Users loaded: #{@users.inspect}" # Per debugging
    end

    #option
    def option
      # Logica per mostrare il tutorial
    end

    #tutorial
    before_action :tutorialID, only: [:tutorial_element]
    def tutorial
      # Logica per mostrare il tutorial
    end
    def tutorial_element
      # Logica per mostrare un elemento del tutorial
    end
    private
    def tutorialID
      @tutorialID = params[:id]
    end


    #report
    def new
      @report = Report.new
    end

    def create
      @report = Report.new(report_params)
      if @report.save
        redirect_to root_path, notice: 'Report was successfully created.'
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
