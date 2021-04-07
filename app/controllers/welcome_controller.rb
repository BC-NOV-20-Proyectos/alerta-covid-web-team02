class WelcomeController < ActionController::Base
  def index
    puts user_signed_in?
    if user_signed_in? == false
      authenticate_user!
    end
  end
end