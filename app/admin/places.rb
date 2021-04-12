ActiveAdmin.register Place do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :area, :institute_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :area, :institute_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do 
    selectable_column
    column :id
    column :name
    column :area
    column :institute do |place|
      "#{Institute.find(place.institute_id).name}"
    end
    column :qr do |place| 
        image_tag "data:image/png;base64, #{QrController.create("#{place.id}|#{place.name}")}" 
    end
    actions
  end

  show do 
    attributes_table do
      row :name 
      row :area
      row :institute do |place|
        "#{Institute.find(place.institute_id).name}"
      end
      row :created_at
      row :updated_at
      row :qr do |place| 
        image_tag "data:image/png;base64, #{QrController.create("#{place.id}|#{place.name}")}" 
      end
    end
    active_admin_comments
  end
  
end
