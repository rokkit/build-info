# encoding: UTF-8
ActiveAdmin.register News do
  menu parent: "Наполнение сайта"
  form do |f|
    f.inputs do
      f.input :name
      f.input :content
    end
    f.actions
  end
end
