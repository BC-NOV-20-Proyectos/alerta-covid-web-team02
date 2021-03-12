class SectionsController < InheritedResources::Base

  private

    def section_params
      params.require(:section).permit(:name, :institute_id)
    end

end
