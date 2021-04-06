class InstitutesController < ActionController::API
  #skip_before_action :verify_authenticity_token

  def index
    @institutes = [
      {
        name: "Ucol"
      }
    ]

    render json: @institutes
  end

  private

    def institute_params
      params.require(:institute).permit(:name, :address)
    end

  

end
