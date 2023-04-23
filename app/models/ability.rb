class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    user ||= User.new

    can :read, :all
    can :manage, Group, user_id: user.id
    can :manage, Food, user_id: user.id
  end
end
