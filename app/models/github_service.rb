class GithubService
  attr_reader :connection, :user

  def initialize(user)
    @user = user
    @connection = Hurley::Client.new("https://api.github.com")
    @connection.query[:access_token] = user.token
    @connection.header[:accept] = "application/vnd.github+json"
  end

  def repos(user)
    parse(connection.get("users/#{user.nickname}/repos"))
  end

  def pull_request_count(user)
    repos(user).map do |repo|
      parse(connection.
            get("repos/#{user.nickname}/#{repo["name"]}/pulls")).count
    end
  end

  def starred_repos(user)
    parse(connection.get("users/#{user.nickname}/starred")).count
  end

  def followers(user)
    parse(connection.get("users/#{user.nickname}/followers"))
  end

  def latest_followers_events(user)
    followers(user).map do |follower|
      parse(connection.get("users/#{follower["login"]}/events"))
    end
  end

  def organizations(user)
    parse(connection.get("users/#{user.nickname}/orgs"))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
