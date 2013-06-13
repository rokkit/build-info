# encoding: UTF-8
ActiveAdmin.register Country do
      menu parent: "Справочник", priority: 0
      collection_action :autocomplete_country_name, :method => :get
      controller do
        autocomplete :country, :name
      end
end
