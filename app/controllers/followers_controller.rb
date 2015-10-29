class FollowersController < ApplicationController
  before_action :visitor

  def index
    visitor
    @show = FollowerDecorator.new(current_user)
  end
end
