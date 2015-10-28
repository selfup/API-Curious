class FollowersController < ApplicationController
  def index
    @followers = Github.new(current_user).all_followers
  end
end
