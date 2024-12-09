# app/controllers/supervisorpage/home_controller.rb
module Supervisorpage
  class HomeController < ApplicationController
    before_action :authenticate_supervisor!
    before_action :set_report, only: [:sup_show_report]
    before_action :set_operator, only: [:sup_show_op]

    def supervisor_index
      @supervisor = current_supervisor
      @operators = Operator.where(supervisor_id: current_supervisor.id)

      @reports = []
      for operator in @operators
        @reports.concat(ReportDone.where(operator_id: operator.id))
      end
    end

    def sup_show_op
      @contReport = ReportDone.where(operator_id: @operator.id).count
    end

    def sup_show_report
      @messages = Message.all
    end

    def sup_report_list
      @reports = ReportDone.all
    end

    private

    def set_report
      @report = ReportDone.find(params[:id])
      @user = User.find(@report.user_id)
      @operator = Operator.find(@report.operator_id)
    end

    def set_operator
      @operator = Operator.find(params[:id])
      @reports = ReportDone.where(operator_id: @operator.id).order(created_at: :desc)
    end
    
  end
end