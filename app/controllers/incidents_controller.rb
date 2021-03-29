class IncidentsController < ApplicationController
    #skip_forgery_protection
    skip_before_action :verify_authenticity_token, raise: false
    before_action :authenticate_user!, only: :create
    puts @current_user_id
    def create
        user = @current_user_id
        places = params[:places]
        covid_positive = nil
        covid_negative = nil
        covid_positive = true if params[:covid_positive]
        covid_negative = true if params[:covid_positive] == false
        places.each do |place|
            incident = {
                symptomatic: params[:symptomatic],
                covid_positive: covid_positive,
                covid_negative: covid_negative,
                user_id: user,
                place_id: place
            }
            puts incident
            Incident.create!(incident)
        end
        render json: {
            "error": false,
            "code": "INC_CREATED"
        }
    end  
end