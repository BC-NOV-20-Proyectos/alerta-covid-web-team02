class ReportsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def user_report
        time_to = (Time.now + 1.day).strftime("%Y-%m-%d")
        time_from = 10.days.ago.strftime("%Y-%m-%d")
        @incidents = Incident.where("created_at BETWEEN >= '#{time_from.to_s}'::timestamp AND created_at <= '#{time_to.to_s}'::timestamp")
        puts @incidents.inspect
        puts format_user_report.inspect
        render json: { "error": false, "code": "INC_CREATED" }
    end

    def format_user_report
        report_array = []
        @incidents.each do |incident| 
            json_incident = {
                "institute": incident.user.institute.name,
                "section": incident.user.section.name,
                "name": incident.user.email,
                "symptomatic": incident.symptomatic,
                "covid_positive": incident.covid_positive,
                "covid_negative": incident.covid_negative                
            }
            report_array << json_incident
        end
        report_array
    end
end
