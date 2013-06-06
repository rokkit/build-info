class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  def index
  end
  def profile
    @user = current_user
  end
end
