class Ability
  include CanCan::Ability
  # Create, Read, Update, Destroy:
  # :create : new, create
  # :read : index, show
  # :update : edit, update
  # :destroy : destroy
  # :manage : all 7 above actions


  def initialize(user)
    if user.nil?
        can :read, [Category, Product]
    elsif user.role? "admin"
        can :manage, [Category, Product, Review]
    elsif user.role? "moderator"
        can :read, [Category, Product, Review]
        can :create, Review
        can :update, [Category,Product]
        can :destroy, Review
    elsif user.role? "customer"
        can :read, [Category, Product]
        can [:read, :create], Review
        can [:update, :destroy], Review do |review|
            review.user_id == user.id
        end
    end
  end



    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
