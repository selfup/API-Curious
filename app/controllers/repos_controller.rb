class ReposController < ApplicationController
  before_action :visitor

  def index
    @repos = Github.new(current_user).all_repos
  end
end
