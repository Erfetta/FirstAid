module Operatorpage
  class ManualController < ApplicationController
    before_action :set_manualID , only: [:manual_element]
    def manual_list

    end
    def manual_element
        
    end
    private
    def set_manualID
      @manualID = params[:id]
    end
  end
end