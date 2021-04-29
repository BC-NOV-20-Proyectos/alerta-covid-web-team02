module Api
    class FilterController < ApplicationController
        skip_before_action :verify_authenticity_token#, raise: false
        before_action :authenticate_admin_user!, only: :create
        def filter_section
            institute_id = params[:institute_id]
            filtered_sections = Section.where("institute_id = ?", institute_id)
            render :json => {
                sections: filtered_sections
            }
        end        
    end
end