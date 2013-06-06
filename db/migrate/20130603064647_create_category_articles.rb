class CreateCategoryArticles < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default user
    
    u=User.create(:email => 'admin@mail.com', :password => 'password', :password_confirmation => 'password') if direction == :up
    u.approve!
    u.roles << Role.new(name:"admin")
    u.save!
  end
  def change
    create_table :category_articles do |t|
      t.string :name

      t.timestamps
    end
  end
end
