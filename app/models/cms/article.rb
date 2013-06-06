class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category_article
  attr_accessible :content, :name, :published, :category_article_id,
                  :user_id, :rating
  
  before_create :make_unpublished
  
  scope :published, where(published: true)
  scope :top, Article.published
  def to_s
    name
  end
  private
  def make_unpublished
    #published = false
  end
end
