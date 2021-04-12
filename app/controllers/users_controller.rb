class UsersController < ActionController::Base
    before_action :authenticate_user!, only: :get_user

    def get_user
        render json: {"name": current_user}
    end
end
