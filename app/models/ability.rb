class Ability
  include CanCan::Ability


  def initialize(user)

    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    cannot :favourite, Post do |x|
      x.user == user
    end

    can :favourite, Post do |x|
      x.user != user
    end

    can :delete, Comment do |c|
      c.user == user || c.post.user == user
    end

    can :manage, Post do |x|
      x.user == user
    end

  end
end
