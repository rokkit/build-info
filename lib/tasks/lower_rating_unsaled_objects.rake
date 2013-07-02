namespace :worker do
  desc "parse"
  task :lower_rating_unsaled_objects => :environment do
    puts "lower rating"
    BuildObject.all.find_each do |buildobject|
      #buildobject.rating -= 1 if buildobject.
    end
  end
end
