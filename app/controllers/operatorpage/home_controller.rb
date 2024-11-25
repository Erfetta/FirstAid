# app/controllers/operatorpage/home_controller.rb
module Operatorpage
  class HomeController < ApplicationController
    before_action :authenticate_operator!
    before_action :set_report, only: [:show_report]
    before_action :istaken_report, only: [:show_report]
    
    def operator_index
      @operator = current_operator
      @reports = Report.where(operator_id: nil).or(Report.where(operator_id: current_operator.id)).order(created_at: :desc)
    end
    
    def show_report 
      @messages = Message.all
      @report_id = params[:report_id] # Recupera l'ID del report dall'URL
    end

    def update_op_id
      @report = Report.find(params[:id])
      @report.operator_id = current_operator.id
      if @report.save
        redirect_to show_report_path
      end
    end

    def remove_me_from_report
      @report = Report.find(params[:id])
      @report.operator_id = nil
      if @report.save
        redirect_to show_report_path
      end
    end


    def mark_as_done
      @report = Report.find(params[:id])
     
    
      # Crea un nuovo ReportDone con i dati da @report
      report_done = ReportDone.new(
        report_time: @report.created_at,  # Usa report_time invece di report_datetime
        coordinates: @report.coordinates,
        user_id: @report.user_id,
        operator_id: @report.operator_id,
        question1: @report.question1,
        question2: @report.question2,
        question3: @report.question3,
        question4: @report.question4,
        question5: @report.question5,
        question6: @report.question6,
        question7: @report.question7,
        question8: @report.question8,
        question9: @report.question9,
        question10: @report.question10,
        question11: @report.question11,
        question12: @report.question12,
        question13: @report.question13,
        question14: @report.question14,
        contact_method: @report.contact_method
      )
    
      
      if report_done.save
        @report.destroy
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
    
    
    
    
    
    
    private

    def set_report
      @report = Report.find(params[:id])
      @user = User.find(@report.user_id)
    end

    def istaken_report
      if @report.operator_id != nil
        @rep_taken = true
      else
        @rep_taken = false
      end
    end

  end
end
