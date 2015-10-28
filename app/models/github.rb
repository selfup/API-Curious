class Github < OpenStruct
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def service
    @service ||= GithubService.new(user)
  end

  def all_repos
    service.repos(user).map { |repo| repo }
  end

  def pull_requests
    service.pull_request_count(user).map { |pr| pr }
  end

  def all_followers
    service.followers(user).map { |follower| follower }
  end

  def self.find(id)
    Github.new(service.repos(id))
  end

  def self.find(name)
    Github.new(service.repo(name))
  end

  def self.create(params)
    Github.new(service.create(params))
  end
end
