class CabinetController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = current_user
  end
  
  def analytics
  end
  
  def upgrade_account
    
  end
  
end
