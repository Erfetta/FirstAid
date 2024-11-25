# app/controllers/chat_controller.rb
class ChatController < ApplicationController
  def index_user
    # Logica per visualizzare la chat
    @messages = Message.all
    @report_id = params[:report_id] # Recupera l'ID del report dall'URL
  end

  def index_operator
    # Logica per visualizzare la chat
    @messages = Message.all
    @report_id = params[:report_id] # Recupera l'ID del report dall'URL
  end

  # reports_controller.rb
  def show
    @report = Report.find(params[:id])
    @report_id = @report.id
  end

  def exists
    report = Report.find_by(id: params[:id])
    if report
      render json: { exists: true }
    else
      render json: { exists: false }
    end
  end

  
end
