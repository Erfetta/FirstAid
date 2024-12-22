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
      reports = ReportDone.where(operator_id: @operator.id).order(created_at: :desc)

      sumReview = 0
      contReview = 0
      for rep in reports
        if rep.rating != nil && rep.rating != -1
          sumReview += rep.rating
          contReview += 1
        end
      end
      if contReview == 0
        @avgReview = 0
      else
        @avgReview = (sumReview.to_f / contReview).round(2)
      end
    end

    def sup_show_report
      @messages = Message.all
    end

    def sup_report_list
      @operators = Operator.where(supervisor_id: current_supervisor.id)
      @reports = []
      for operator in @operators
        @reports.concat(ReportDone.where(operator_id: operator.id))
      end
    end

    def sup_recap
      operators = Operator.where(supervisor_id: current_supervisor.id)
      reports = ReportDone.where(operator_id: operators.pluck(:id))
      @contReport = reports.count

      @daily_data = reports
        .group(Arel.sql("strftime('%Y-%m-%d', created_at)"))
        .count

      @weekly_data = reports
        .group(Arel.sql("strftime('%Y-%W', created_at)"))
        .count

      @monthly_data = reports
        .group(Arel.sql("strftime('%Y-%m', created_at)"))
        .count

      @contOperator = operators.count
      @rep4op = (@contReport.to_f / @contOperator).round(2)
      supRev = 0
      contRev = 0
      for rep in reports
        if rep.rating != nil && rep.rating != -1
          supRev += rep.rating
          contRev += 1
        end
      end
      if contRev == 0
        @avgReview = 0
      else
        @avgReview = (supRev.to_f / contRev).round(2)
      end

      @contOpActive = 0
      for op in operators
        rep = ReportDone.where(operator_id: op.id).count
        if rep > 0
          @contOpActive += 1
        end
      end

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