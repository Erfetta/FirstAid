# app/controllers/operatorpage/home_controller.rb
module Operatorpage
  class HomeController < ApplicationController
    before_action :authenticate_operator!
    before_action :set_report, only: [:show_report]
    before_action :istaken_report, only: [:show_report]
    def operator_index
      @operator = current_operator
      @reports = Report.where(operator_id: nil).order(created_at: :desc)
    end
    def update_op_id
      @report = Report.find(params[:id])
      @report.operator_id = current_operator.id
      if @report.save
        redirect_to show_report_path
      end
    end
    def remove_me_from_report
      @report = Report.find(params[:id])
      @report.operator_id = nil
      if @report.save
        redirect_to show_report_path
      end
    end
    private
    def set_report
      @report = Report.find(params[:id])
      @user = User.find(@report.user_id)
    end
    def istaken_report
      if @report.operator_id != nil
        @rep_taken = true
      else
        @rep_taken = false
      end
    end
  end
end
