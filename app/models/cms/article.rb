class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category_article
  attr_accessible :content, :name, :published, :category_article_id,
                  :user_id, :rating
  
  #before_create :make_unpublished
  validates :category_article, :name, :content, presence: true
  
  scope :published, where('published IS NOT NULL')
  scope :top, Article.published
  scope :top_news, Article.published.joins(:category_article).where(:category_articles => {name: "Новости"})
  
  before_destroy :lower_user_rating
  
  def to_s
    name
  end
  def publish!
    self.published = Time.zone.now
    user.add_rating! :article
    save!
  end
    

private
  def make_unpublished
    self.published = false
  end
  
  def lower_user_rating
    self.user.lower_rating! :destroy_article
  end
  

  

end
