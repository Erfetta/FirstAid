class HomeController < ApplicationController
  def user_index
    @users = User.all
    Rails.logger.debug "Users loaded: #{@users.inspect}" # Per debugging
  end

  def operator_index
    # La logica per l'index degli operatori
    # render plain: "Ciao operatore" può essere usato per debug o test
  end
end