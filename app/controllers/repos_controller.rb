class ReposController < ApplicationController
  def index
    require 'pry' ; binding.pry
    @repos = Repo.new(current_user).all

  end
end
