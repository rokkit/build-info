class StreetsController < InheritedResources::Base
  autocomplete :street, :name
end
