class WelcomeDecorator
  attr_reader :show

  def initialize(user)
    @show = Github.new(user)
  end

  def current_streak
    show.current_streak
  end

  def longest_streak
    show.longest_streak
  end
  def year_to_date
    show.year_to_date
  end

  def starred_repos
    show.starred_repos_count
  end

  def todays_recent_activity
    show.recent_commits
  end
end
