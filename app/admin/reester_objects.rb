# encoding: UTF-8
ActiveAdmin.register ReesterObject do
    action_item :only => :index do
      link_to 'Загрузить CSV', :action => 'upload_csv'
    end
    collection_action :upload_csv do
        render "admin/csv/upload_csv"
      end

      collection_action :import_csv, :method => :post do
        ReesterObject.convert_save("reesterobjects", params[:dump][:file])
        redirect_to :action => :index, :notice => "CSV imported successfully!"
      end
end
