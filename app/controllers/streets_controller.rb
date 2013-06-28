class StreetsController < ApplicationController
  autocomplete :street, :name
  
  def get_autocomplete_items(parameters)
    super(parameters).where(:distinct_id => params[:distinct_id])
  end
end
