class CreateRoles < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default user
    
    u=User.create(:email => 'admin@mail.com', :password => 'password', :password_confirmation => 'password') if direction == :up
    u.roles << Role.new(name:"admin")
    u.save!
  end
  def change
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
  end
end
