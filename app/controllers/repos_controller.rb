class ReposController < ApplicationController
  def index
    @repos = Repo.new(current_user).all
  end

  private

  def parse_url
    sub("api.", "").sub("repos", "")
  end
end
