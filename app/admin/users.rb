ActiveAdmin.register User do
  after_action :send_email, only: [:create, :update]
  
  controller do
    def send_email
      UserMailer.send_key(params[:user], 0).deliver_now
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #permit_params :email, 
  #:password, 
  #:institute_id, 
  #:section_id, 
  #:reports, 
  #:reset_password_token, 
  #:reset_password_sent_at, 
  #:remember_created_at
  #
  # or
  #
  permit_params do
    permitted = [:password, :name, :email, :institute_id, :section_id, :reports]
  end

  form title: 'New User' do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password, input_html: { value: Time.now.to_i.to_s(32), readonly: true }
      f.input :institute_id, as: :select, collection: Institute.all.map { |u| [u.name, u.id] }, include_blank: false
      f.input :section_id, as: :select, collection: Section.all.map { |u| [u.name, u.id] }, include_blank: false
      f.input :reports, as: :boolean
    end
    actions
  end

  index do 
    selectable_column
    column :name
    column :email
    column :institute do |u|
      "#{Institute.find(u.institute_id).name}"
    end
    column :section do |u|
      "#{Section.find(u.section_id).name}"
    end
    column :reports
    actions
  end
  
end
