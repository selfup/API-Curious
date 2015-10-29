class FollowersController < ApplicationController
  def index
    @show = FollowerDecorator.new(current_user)
  end
end
