# app/controllers/operatorpage/home_controller.rb
module Operatorpage
  class HomeController < ApplicationController
    def operator_index
      @reports = Report.where(operator_id: nil).order(created_at: :desc)
    end
  end
end
