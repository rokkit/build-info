class ArticlesController < InheritedResources::Base
  load_and_authorize_resource
  has_scope :published
  def create
      @article = Article.new(params[:article])
      @article.user = current_user
      create!
    end
end
