module Operatorpage
  class ProfileController < ApplicationController
    before_action :authenticate_operator!
    def operator_profile
      @operator = current_operator
      @supervisor = Supervisor.find(@operator.supervisor_id)
    end
  end
end