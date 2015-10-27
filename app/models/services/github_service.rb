class GithubService
  attr_reader :connection, :user

  def initialize(user)
    @user = user
    @connection = Hurley::Client.new("https://api.github.com")
    @connection.query[:access_token] = user.token
  .header[:accept] = "application/vnd.github+json"
  end

  def repos
    require 'pry' ; binding.pry
    parse(connection.get("#{user}/repos"))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
