class WelcomeController < ApplicationController
  def index
    if user_signed_in? == false && admin_user_signed_in? == false
      authenticate_user!
    end
  end
end