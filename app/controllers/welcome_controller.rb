class WelcomeController < ActionController::Base

  def index
    redirect_to '/admin'
  end
end