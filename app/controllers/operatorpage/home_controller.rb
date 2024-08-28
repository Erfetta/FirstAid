# app/controllers/operatorpage/home_controller.rb
module Operatorpage
  class HomeController < ApplicationController
    before_action :set_report, only: [:show_report]
    def operator_index
      @reports = Report.where(operator_id: nil).order(created_at: :desc)
    end
    private
    def set_report
      @report = Report.find(params[:id])
      @user = User.find(@report.user_id)
    end
    
  end
end
