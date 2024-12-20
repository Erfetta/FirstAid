module Userpage
  class HomeController < ApplicationController
    def user_index
      @users = User.all
      @report_pending = ReportDone.find_by(user_id: current_user.id, rating: nil)
      # Elimina i dati obsoleti
      @users.each(&:delete_old_data)
      @report_exists = false
      @user_report = nil
      if current_user.present?
        @user_reports = Report.where(user_id: current_user.id)
        for report in @user_reports
          if report.contact_method == 1
            @user_report = report
            @report_exists = true
          end
        end
      end  
    end

    def new
      if current_user.present?
        @user_id = current_user.id
      else
        @user_id = 8 # Utente non loggato
      end
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
      maxRep = Report.maximum(:id).to_i
      maxRepDone = ReportDone.maximum(:id).to_i
      newID = [maxRep, maxRepDone].max + 1
      @report = Report.new(
        id: newID,
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
        flagCell: params[:flagCell],
        flagInfo: params[:flagInfo]
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

    def review
      puts "### Inizio metodo review"
    
      @report_pending = ReportDone.find_by(user_id: current_user.id, rating: nil)
      
      if @report_pending
        puts "### Report trovato, id report: #{@report_pending.id}"
    
        @report_pending.rating = params[:rating]
        @report_pending.review_text = params[:review_text]
        
        puts "### Rating: #{@report_pending.rating}"
        puts "### Review text: #{@report_pending.review_text}"
    
        if @report_pending.save
          puts "### Report salvato con successo"
          flash.now[:notice] = "Recensione salvata con successo!"
        else
          puts "### Errore nel salvataggio del report"
          flash.now[:alert] = "Si è verificato un errore nel salvataggio della recensione."
          puts "Errori di validazione: #{@report_pending.errors.full_messages.join(', ')}"
        end
      else
        puts "### Nessun report trovato"
        flash.now[:alert] = "Non hai report in attesa di recensione."
      end
    
      respond_to do |format|
        format.js { render 'create' }  # renderizza il file create.js.erb
        format.html { redirect_to root_path, notice: "Recensione inviata!" }
      end
    end
    
    
    
    
    
  


    private
    def tutorialID
      @tutorialID = params[:id]
    end
    
  end
end
