# encoding: UTF-8
ActiveAdmin.register User do
    menu parent: "Пользователи", priority: 0
    index do
      column :fio
      column :email
      column :name
      default_actions
      
    end
    show do |ad|
          attributes_table do
            row :fio
            row :email
            row :phone
            row :rating
            row :agency
            row :roles
            row :created_at
            row :confirmed_at
            bool_row :forem_admin
          end
          panel 'Счёт' do
            attributes_table_for ad.account do
                row :total do |account|
                  number_to_currency account.total, :unit => "руб."
                end
            end
          end
          active_admin_comments
    end
    action_item only: :show do
          button_to "Одобрить регистрацию", approve_admin_user_path(user), method: :post if user.confirmed_at.nil?
    end

    form do |f|
      f.inputs do
        f.input :fio
        f.input :email
        f.input :phone
        f.input :rating
        f.input :agency
        f.input :roles, as: :check_boxes
        f.input :forem_admin
      end
      f.inputs "Счёт", for: :account do |account|
        account.input :total
      end
          f.actions  
    end
    # Available at /admin/posts/1/approve and #approve_admin_post_path(post)
      member_action :approve, :method => :post do
        # Just a regular controller method in here
        user = User.find params[:id]
        user.approve!
        redirect_to admin_user_path(user)
      end
end
