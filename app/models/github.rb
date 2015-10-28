class Github < OpenStruct
  attr_reader :user

  def initialize(user)
    @user = user
    @stats = GithubStats.new(user.nickname)
  end

  def service
    @service ||= GithubService.new(user)
  end

  def all_repos
    service.repos(user).map { |repo| repo }
  end

  def latest_followers_events
    service.latest_followers_events(user).map do |events|
      if events[0] == nil
        {"type" => "No events"}
      else
        events[0]
      end
    end
  end

  def pull_requests
    service.pull_request_count(user).map { |pr| pr }
  end

  def organizations
    if service.organizations(user).count == 0
      puts "No Orgs!"
    else
      service.organizations(user).map { |orgs| orgs }
    end
  end

  def year_to_date
    @stats.data.scores.reduce(:+)
  end

  def current_streak
    @stats.streak.count
  end

  def longest_streak
    @stats.longest_streak.count
  end

  def all_followers
    service.followers(user).map { |follower| follower }
  end

  def self.find(id)
    new(service.repos(id))
  end

  def self.find(name)
    new(service.repo(name))
  end

  def self.create(params)
    new(service.create(params))
  end
end
