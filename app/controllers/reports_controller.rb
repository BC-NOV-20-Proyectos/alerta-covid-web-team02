class ReportsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def user_report
        time_to = (Time.now + 1.day).strftime("%Y-%m-%d")
        time_from = 10.days.ago.strftime("%Y-%m-%d")
        
        if params[:time_from] and params[:time_to]
            time_to = params[:time_to]
            time_from = params[:time_from]
        end
        
        @incidents = Incident.where("created_at BETWEEN '#{time_from.to_s}'::timestamp AND '#{time_to.to_s}'::timestamp")
        @users_report = format_user_report
        render "user_report"
    end

    def format_user_report
        report_array = []
        @incidents.each do |incident| 
            json_incident = {
                "institute": incident.user.institute.name,
                "section": incident.user.section.name,
                "name": incident.user.name,
                "symptomatic": incident.symptomatic,
                "covid_positive": incident.covid_positive,
                "covid_negative": incident.covid_negative                
            }
            report_array << json_incident
        end
        report_array
    end

    def places_report
        time_to = (Time.now + 1.day).strftime("%Y-%m-%d")
        time_from = 10.days.ago.strftime("%Y-%m-%d")
        
        if params[:time_from] and params[:time_to]
            time_to = params[:time_to]
            time_from = params[:time_from]
        end
        @incidents = Incident.select("place_id, SUM(symptomatic) AS symptomatic, SUM(covid_positive) AS positive , SUM(covid_negative) AS negative").where("created_at between '#{time_from}'::timestamp and '#{time_to}'::timestamp").order('positive DESC, symptomatic DESC, negative DESC').group(:place_id);
    end
    def places_report_view
        places_report
        @places_report = format_place_report
        render "places_report.html.erb"
    end
    def places_report_api
        place_reports
        render json:{data: format_place_report}
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
