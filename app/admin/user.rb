# file: app/admin/user.rb
ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name
  index do
    column :name
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    actions
  end

  filter :name
  filter :email

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :authentication_token
      row :confirmed_at
      row :current_sign_in_at
      row :last_sign_in_at
      row :sign_in_count
    end
    active_admin_comments
  end
end