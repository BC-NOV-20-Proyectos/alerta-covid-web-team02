class InstitutesController < ActionController::API


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
