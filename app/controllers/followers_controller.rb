class FollowersController < ApplicationController
  def index
    @show = FollowerDecorator.new(current_user)
    # @followers = Github.new(current_user).all_followers
    # @follower_events = Github.new(current_user).latest_followers_events
  end
end
