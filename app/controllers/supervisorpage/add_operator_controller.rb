module Supervisorpage
  class AddOperatorController < ApplicationController
    before_action :authenticate_supervisor!

    def new
      render 'supervisorpage/home/sup_add_operator'
    end

    def create
      email = params[:operator][:email]
      name = params[:operator][:name]
      surname = params[:operator][:surname]
      randPass = SecureRandom.hex(8)
      supervisor_id = current_supervisor.id
      workplace = current_supervisor.workplace
      resource = Operator.new(email: email, name: name, surname: surname, password: randPass, password_confirmation: randPass, supervisor_id: supervisor_id, workplace: workplace)

      if resource.save
        Rails.logger.info "Sending Credentials email to Operator..."
        SupervisorMailer.send_pass(name, email, randPass, workplace).deliver_now
        Rails.logger.info "Credentials email sent successfully!"
        redirect_to root_path    
      else
        flash.now[:alert] = resource.errors.full_messages.join(', ')
        render 'supervisorpage/home/sup_add_operator'
      end
    end

  end
end