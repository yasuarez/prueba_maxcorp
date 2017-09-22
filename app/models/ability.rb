class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
      if user.role :admin
        can :manage, :all
      else
        can [:read,:create,:update], Product
        can :read, Inventory
        can :read, Suppliers
      end
  end
end
