class Relationship < ActiveRecord::Base
  attr_accessible :node_id, :node_two_id
  belongs_to :node
  belongs_to :node_two, class_name: 'Node'
end
