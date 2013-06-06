class CreateCategoryArticles < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default user
     if direction == :up
        u=User.create(:email => 'admin@mail.com', :password => 'password', :password_confirmation => 'password')
        u.approve!
        u.roles << Role.new(name:"admin")
        u.save!
    end
  end
  def change
    create_table :category_articles do |t|
      t.string :name

      t.timestamps
    end
  end
end
