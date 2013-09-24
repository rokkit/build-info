class ArticlesController < InheritedResources::Base
  # load_and_authorize_resource
  before_filter :authenticate_user!, :except => [:index, :show]
  
  has_scope :published
  def create
      @article = Article.new(params[:article])
      @article.user = current_user
      create!
    end
    def index
      if params[:news].present?
        @articles = Article.includes([:user, :category_article]).published.all_news        
      else
        @articles = Article.includes([:user, :category_article]).published
      end
    end
end
