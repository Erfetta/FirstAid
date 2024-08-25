# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    @users = User.all  # Se hai un modello User e vuoi visualizzare tutti gli utenti
  end

  def show
    @user = User.find(params[:id])
  end
end

