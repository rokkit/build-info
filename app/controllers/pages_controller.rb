class PagesController < ApplicationController
  before_filter :authenticate_user!
  def index
  end
  def profile
    @user = current_user
  end
end
