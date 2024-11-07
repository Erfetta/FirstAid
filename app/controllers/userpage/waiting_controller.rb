module Userpage
  class WaitingController < ApplicationController
    def index
      @report = Report.find_by(id: params[:id])
      if @report.present?
        render template: "userpage/home/waiting"
      else
        Rails.logger.debug("Report non trovato")
        redirect_to root_path # oppure una pagina di errore
      end
    end

    def check_operator_assigned
      @report = Report.find(params[:id])
      if @report.operator_id.present?
        render json: { assigned: true }
      else
        render json: { assigned: false }
      end
    end
  end
end
