module Userpage
  class HomeController < ApplicationController
    def user_index
      @users = User.all
      Rails.logger.debug "Users loaded: #{@users.inspect}" # Per debugging
    end

    #option
    def option
      # Logica per mostrare il tutorial
    end

    #tutorial
    before_action :tutorialID, only: [:tutorial_element]
    def tutorial
      # Logica per mostrare il tutorial
    end
    def tutorial_element
      # Logica per mostrare un elemento del tutorial
    end

    #report
    def create
      @report = Report.new(
        coordinates: params[:coordinates],
        user_id: params[:user_id],
        question1: params[:question1],
        question2: params[:question2],
        question3: params[:question3],
        question4: params[:question4],
        question5: params[:question5],
        question6: params[:question6],
        question7: params[:question7],
        question8: params[:question8],
        question9: params[:question9],
        question10: params[:question10],
        question11: params[:question11],
        question12: params[:question12],
        question13: params[:question13],
        question14: params[:question14],
        contact_method: params[:contact_method],
      )
      if @report.save
        flash[:notice] = 'Report creato con successo!'
        if @report.contact_method == 1
          redirect_to waiting_path(id: @report.id)
        else
          redirect_to root_path
        end
      else
        # deb.log dell'errore
        Rails.logger.debug("Errors: #{@report.errors.full_messages}")
        flash[:alert] = 'Errore nella creazione del report'
      end
    end

    

    private
    def tutorialID
      @tutorialID = params[:id]
    end
    
  end
end
