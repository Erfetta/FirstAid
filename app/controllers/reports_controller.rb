class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def create
   
    
    @report = Report.new(report_params)
  
    if @report.save
      redirect_to root_path, notice: 'Report was successfully created.'
    else
      puts @report.errors.full_messages
      render :new
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  def show
    @report = Report.find(params[:id])
    
    # Aggiorna l'operator_id
    @report.update(operator_id: 234567)

    # Potresti voler aggiungere una logica per gestire errori in caso l'update non funzioni
  end
  
  private

  def report_params
    params.require(:report).permit(:report_time, :report_date, :coordinates, :user_id)
  end
end
