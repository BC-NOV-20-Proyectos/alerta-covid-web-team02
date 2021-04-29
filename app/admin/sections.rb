ActiveAdmin.register Section do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :institute_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :institute_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do    

    selectable_column
    column :id
    column :name
    column :created_at
    column :updated_at
    
    actions defaults: false do |row|
      text_node link_to "View", admin_section_path(row), class: "view_link member_link"
      text_node link_to "Edit", edit_admin_section_path(row), class: "edit_link member_link"

      if User.where("section_id = #{row.id}").length == 0 
        text_node link_to I18n.t('active_admin.delete'), admin_section_path(row), method: :delete, data: { confirm: I18n.t('active_admin.delete_confirmation') }, class: "delete_link member_link"
      end
    end
  end
end
