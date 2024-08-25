# app/controllers/reports_controller.rb
class ReportsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_operators, only: [:new, :create]

  def new
    @report = @user.reports.build
  end

  def create
    @report = @user.reports.build(report_params)
    if @report.save
      redirect_to user_reports_path(@user), notice: 'Segnalazione creata con successo.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Utente non trovato.'
  end

  def set_operators
    @operators = Operator.all
  end

  def report_params
    params.require(:report).permit(:ora, :data, :coordinate, :operator_id)
  end
end
