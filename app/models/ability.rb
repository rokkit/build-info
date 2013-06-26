class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)

      if user.role? :admin
        can :manage, :all
      else
        can :read, Article, published: true
        can [:update, :destroy], Article do |article|
                article.try(:user) == user
                true
        end
        can :manage, BuildObject do |house|
                house.try(:user) == user
        end
        
        can :manage, Review do |review|
          review.user == user
        end
        
        can [:read, :update, :destroy], Agency do |agency|
          agency.owner == user
        end
        can :working, Agency do |agency|
          user.agency == agency
        end
      end
      if user.role? :super_user or user.role? :admin
        can :invest, :all
      end
      can :request_review, BuildObject do |build_object| #запрос на просмотр, пользовател не должен запрашивать у своих объектов
        build_object.user != user && !user.id.nil? 
      end
      
      if user.role? :agency_owner
        can :manage, Agency do |agency|
          agency.owner == user
        end
      end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
