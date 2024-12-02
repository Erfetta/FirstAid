# app/controllers/supervisorpage/home_controller.rb
module Supervisorpage
  class HomeController < ApplicationController
    before_action :authenticate_supervisor!

    def supervisor_index
      @supervisor = current_supervisor
      @operators = Operator.where(supervisor_id: current_supervisor.id)

      @reports = []
      for operator in @operators
        @reports.concat(ReportDone.where(operator_id: operator.id))
      end
    end
    
  end
end