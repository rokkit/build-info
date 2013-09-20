# encoding: UTF-8
ActiveAdmin.register ReesterObject do
  menu parent: "Параметры объекта"
  
    action_item :only => :index do
      link_to 'Загрузить CSV', :action => 'import_reester_objects_new'
    end
    collection_action :import_reester_objects_new do
        render "admin/import/import"
      end

      collection_action :import_reester_objects, :method => :post do
        DataImporter.import(ReesterObject,params[:file])
        redirect_to :action => :index, :notice => "CSV imported successfully!"
      end
end
