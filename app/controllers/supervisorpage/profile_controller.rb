module Supervisorpage
  class ProfileController < ApplicationController
    before_action :authenticate_supervisor!
    def supervisor_profile
      @supervisor = current_supervisor
    end
  end
end