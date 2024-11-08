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
# reports_controller.rb
def show
  @report = Report.find(params[:id])
  @report_id = @report.id
end





  
end
