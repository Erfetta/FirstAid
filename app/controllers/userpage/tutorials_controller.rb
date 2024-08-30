module Userpage
  class TutorialsController < ApplicationController
    before_action :tutorialID, only: [:tutorial_element]
    def tutorial
      # Logica per mostrare il tutorial
    end
    def tutorial_element
      # Logica per mostrare un elemento del tutorial
    end
    private
    def tutorialID
      @tutorialID = params[:id]
    end
  end
end