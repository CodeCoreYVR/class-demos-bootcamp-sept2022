# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:

    user ||= User.new #guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

    #:read is an alias for :index and :show
    #alias_action :index, :show, :to => :read

    alias_action :create, :read, :update, :delete, :to => :crud

    can :crud, Question do |question|
      user == question.user
    end
    #can? :crud, Question, user_id: user.id

    can :crud, Answer do |answer|
      user == answer.user #|| answer.question.user
    end

    can :crud, JobPost do |job_post|
      user == job_post.user
    end

    can :like, Question do |question|
      user.persisted? && question.user != user
      #checks if the user is in the database
      #does not allow the question's owner to like their own question
    end
    #the above method will allow us to:
    # can? :like @question -> this will execute the above rule

    can :destroy, Like do |like|
      like.user == user
    end

    #IMPORTANT!!! We are defining the rules in ability.rb but we are not enforcing it yet
    #You will have to enforce the rules yourself in the views and controllers where applicable

  end
end
