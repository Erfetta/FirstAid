module Operatorpage
  class HistoryController < ApplicationController
    before_action :authenticate_operator!
    before_action :set_report_done, only: [:show_report_done]

    def report_history_list
      @operator = current_operator
      @reports = ReportDone.where(operator_id: current_operator.id).order(created_at: :desc)
    end

    def show_report_done

    end

    private

    def set_report_done
      @report = ReportDone.find(params[:id])
      @user = User.find(@report.user_id)
    end
  end
end