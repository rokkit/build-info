# encoding: UTF-8
ActiveAdmin.register Country do
      menu parent: "Справочник", priority: 0
      collection_action :autocomplete_country_name, :method => :get
      controller do
        autocomplete :country, :name
      end
      
      action_item :only => :index do
        link_to 'Загрузить CSV', :action => 'import_country_new'
      end
      collection_action :import_country_new do
          render "admin/import/import"
        end

        collection_action :import_country, :method => :post do
          DataImporter.import(Country,params[:file])
          redirect_to :action => :index, :notice => "CSV imported successfully!"
        end
end
