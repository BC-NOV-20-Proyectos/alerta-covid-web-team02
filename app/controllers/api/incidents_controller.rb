module Api
    class IncidentsController < ApplicationController
        skip_before_action :verify_authenticity_token#, raise: false
        before_action :authenticate_api_user!, only: :create
        def create
            user = current_api_user.id
            places = params[:places]
            covid_positive = nil
            covid_negative = nil
            covid_positive = 1 if params[:covid_positive]
            covid_negative = 1 if params[:covid_positive] == false
            places_name = []
            places.each do |place|

                if covid_positive == 1
                    places_name << Place.find(place).name;
                end
                incident = {
                    symptomatic: params[:symptomatic],
                    covid_positive: covid_positive,
                    covid_negative: covid_negative,
                    user_id: user,
                    place_id: place
                }
                Incident.create!(incident)
            
            end

            if covid_positive == 1

                notify_user(places_name, places[0])
            end
            
            
            
            

            render json: {
                "error": false,
                "code": "INC_CREATED"
            }

        end


        def notify_user(places_name, place_id)

            @institute = Place.find(place_id).institute;
            @users = User.where("institute_id = #{@institute.id}")

            @users.each do |user|
                UserMailer.send_alert(places_name, user.email).deliver_now

            end
            
        end
        
    end
end