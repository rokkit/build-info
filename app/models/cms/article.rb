class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category_article
  attr_accessible :content, :name, :published, :category_article_id,
                  :user_id, :rating
  
  #before_create :make_unpublished
  validates :category_article, :name, :content, presence: true
  
  scope :published, where(published: true)
  scope :top, Article.published
  def to_s
    name
  end
  def publish!
    published = true
    user.add_rating! :article
  end
  private
  def make_unpublished
    self.published = false
  end
  

  

end
