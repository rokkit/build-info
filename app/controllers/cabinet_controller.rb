class CabinetController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = current_user
  end
  
  def analytics
  end
  
  def upgrade_account
    
  end
  
  def lowbalance
    @price = 0#Variables.find_by_key(params[:action].to_s).try(:value)
  end
  
  def add_rating
    
  end
  
end
