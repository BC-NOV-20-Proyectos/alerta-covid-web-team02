class PlacesController < InheritedResources::Base

  private

    def place_params
      params.require(:place).permit(:name, :area, :institute_id)
    end

end
