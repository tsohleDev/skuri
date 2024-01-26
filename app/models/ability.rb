# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :read, :all
      cannot :manage, [Cart, Wishlist]
    else
      can :read, Product
      can :read, User, id: user.id
      can :manage, Cart, user_id: user.id
      can :manage, Wishlist, user_id: user.id
    end
  end
end
