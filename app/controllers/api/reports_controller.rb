module Api
    class ReportsController < ApplicationController
        skip_before_action :verify_authenticity_token
        before_action :authenticate_api_user!, only: [:places_report_api]
        def places_report
            time_to = (Time.now + 1.day).strftime("%Y-%m-%d")
            time_from = 10.days.ago.strftime("%Y-%m-%d")
            
            if (params[:time_from] != nil and params[:time_to] != nil) and (params[:time_from] != "" and params[:time_to] != "") 
                time_to = params[:time_to]
                    time_from = params[:time_from]
            end
            @incidents = Incident.select("place_id, SUM(symptomatic) AS symptomatic, SUM(covid_positive) AS positive , SUM(covid_negative) AS negative").where("created_at between '#{time_from}'::timestamp and '#{time_to}'::timestamp").order('symptomatic DESC, negative DESC, positive DESC').group(:place_id);
        end
        def places_report_api
            places_report
            @places_report = format_place_report
            render json:{data: @places_report}
        end
        def format_place_report
            report_array = []
            @incidents.each do |incident| 
                json_incident = {
                    "institute": incident.place.institute.name,
                    "area": incident.place.area,
                    "name": incident.place.name,
                    "symptomatic": incident[:symptomatic],
                    "covid_positive": incident[:positive] == nil ? 0 : incident[:positive],
                    "covid_negative": incident[:negative] == nil ? 0 : incident[:negative]               
                }
                report_array << json_incident
            end
            report_array
        end
    end
end