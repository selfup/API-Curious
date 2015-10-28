class WelcomeController < ApplicationController
  def index
    if current_user == nil
      current_user
    else
      @current_streak = Github.new(current_user).current_streak
      @longest_streak = Github.new(current_user).longest_streak
      @year_to_date   = Github.new(current_user).year_to_date
      @starred_repos  = Github.new(current_user).starred_repos_count
      @todays_recent_activity = Github.new(current_user).recent_commits
    end
  end
end
