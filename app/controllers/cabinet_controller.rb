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
    @price = Variables.find_by_key(params[:action]).try(:value)
  end
  
  def add_rating
    
  end
  
end
