class WelcomeController < ApplicationController
  def index
    @current_streak = Github.new(current_user).current_streak
    @longest_streak = Github.new(current_user).longest_streak
    @year_to_date   = Github.new(current_user).year_to_date
  end
end
