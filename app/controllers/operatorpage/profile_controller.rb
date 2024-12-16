module Operatorpage
  class ProfileController < ApplicationController
    before_action :authenticate_operator!

    def operator_profile
      @operator = current_operator
      @supervisor = Supervisor.find(@operator.supervisor_id)
    end

    def update_password
      actualPass = operator_params[:current_password]
      newPass = operator_params[:password]
      newPassConf = operator_params[:password_confirmation]
      if newPass != newPassConf
        return
      end
      if current_operator.valid_password?(actualPass)
        current_operator.password = newPass
        current_operator.password_confirmation = newPassConf
        if current_operator.save
          redirect_to profile_path
        end
      end
    end
    
    private
    
    def operator_params
      params.require(:operator).permit(:current_password, :password, :password_confirmation)
    end
  end
end