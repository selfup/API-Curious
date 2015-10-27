class ReposController < ApplicationController
  def index
    @repos = Repo.new(current_user).all
  end
end
