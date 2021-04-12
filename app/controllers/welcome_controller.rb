class WelcomeController < ApplicationController
  def index
    if user_signed_in? == false && admin_user_signed_in? == false
      authenticate_user!
    else
      @path_signout = "/users/sign_out" if user_signed_in?
      @path_signout = "/admin/logout" if admin_user_signed_in?
    end
  end
end