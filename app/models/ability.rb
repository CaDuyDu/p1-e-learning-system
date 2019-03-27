class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    if @user.supperadmin?
      role_supperadmin
    elsif @user.admin?
      role_admin
    else
      can :read, :all
    end
  end

  def role_admin
    can :manage, Course
    can :manage, Lesson

    can %i(read update), User, id: @user.id
    can :create, User

    can :manage, Subject

    can %i(show), Admin::UsersController

  end

  def role_supperadmin
    role_admin
    can :manage, User
  end
end
