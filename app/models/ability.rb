# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
        can :access, :rails_admin       # only allow admin users to access Rails Admin
        can :manage, :dashboard         # allow access to dashboard
      else
        can :read, :all
      end
  end
end

