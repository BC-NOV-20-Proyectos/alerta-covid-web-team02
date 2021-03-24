class IncidentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, only: :create

    def create
        user = 12
        places = params[:places]
        places.each do |place|
            incident = {
                symptomatic: params[:symptomatic],
                covid_positive: params[:covid_positive] ? true : nil,
                covid_negative: !params[:covid_positive] ? true : nil,
                user_id: user,
                place_id: place
            }
            Incident.create!(incident)
        end

        render json: {
            "error": false,
            "code": "INC_CREATED"
        }
    end  
end