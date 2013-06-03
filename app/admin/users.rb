ActiveAdmin.register User do
    menu parent: "Пользователи", priority: 0
    form do |f|
      f.inputs do
        f.input :fio
        f.input :email
        f.input :roles, as: :check_boxes
      end
          f.actions  
    end
end
