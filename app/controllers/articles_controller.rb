class ArticlesController < InheritedResources::Base
  # load_and_authorize_resource
  before_filter :authenticate_user!, :except => [:index]
  
  has_scope :published
  def create
      @article = Article.new(params[:article])
      @article.user = current_user
      create!
    end
    def index
      @articles = Article.published
    end
end
