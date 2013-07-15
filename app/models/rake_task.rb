class RakeTask < ActiveRecord::Base
  attr_accessible :name, :shedule, :status, :task
  serialize :shedule, Hash
end
