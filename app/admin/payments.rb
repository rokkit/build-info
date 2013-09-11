ActiveAdmin.register Payment do

  menu parent: "Финансы", priority: 0
  show do |ad|
        attributes_table do
          row :account
          bool_row :status
        end
        active_admin_comments
  end
  form do |f|
    f.inputs do
      f.input :status
    end
        f.actions  
  end
end
