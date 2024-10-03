# app/controllers/operatorpage/home_controller.rb
module Operatorpage
  class HomeController < ApplicationController
    before_action :authenticate_operator!
    before_action :set_report, only: [:show_report]
    def operator_index
      @operator = current_operator
      @reports = Report.where(operator_id: nil).order(created_at: :desc)
    end
    private
    def set_report
      @report = Report.find(params[:id])
      @user = User.find(@report.user_id)
    end
    def update_op_id
      @report = Report.find(params[:id])
      @report.operator_id = current_operator.id
      @report.save
    end

  end
end
