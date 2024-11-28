# app/controllers/operatorpage/home_controller.rb
module Supervisorpage
  class HomeController < ApplicationController
    before_action :authenticate_supervisor!

    def index
      @supervisor = current_supervisor
      @operators = Operator.where(supervisor_id: current_supervisor.id)
    end
    
  end
end