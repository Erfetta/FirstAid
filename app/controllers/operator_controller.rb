class OperatorsController < ApplicationController
  def dashboard
    @reports = Report.all.order(created_at: :desc) # Recupera tutti i reports, ordinati per data di creazione
  end
end
