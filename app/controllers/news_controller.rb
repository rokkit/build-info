class NewsController < InheritedResources::Base
  has_scope :published
end
