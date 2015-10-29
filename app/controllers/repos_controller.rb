class ReposController < ApplicationController
  def index
    @repos = Github.new(current_user).all_repos
  end
end
