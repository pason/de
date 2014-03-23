class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    
    can :read, Event 
    can :create, Event
    can :update, Event, :user_id => user.id
    can :destroy, Event, :user_id => user.id
    

    
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
