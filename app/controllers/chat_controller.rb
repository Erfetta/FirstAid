# app/controllers/chat_controller.rb
class ChatController < ApplicationController
  def index_user
    # Logica per visualizzare la chat
    @messages = Message.all
  end

  def index_operator
    # Logica per visualizzare la chat
    @messages = Message.all
  end

  # reports_controller.rb
def show
  @report = Report.find(params[:id])
  # Passa l'ID del report alla vista
  @report_id = @report.id
end

  
end
