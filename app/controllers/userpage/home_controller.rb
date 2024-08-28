module Userpage
  class HomeController < ApplicationController
    def user_index
      @users = User.all
      Rails.logger.debug "Users loaded: #{@users.inspect}" # Per debugging
    end
  end
end
