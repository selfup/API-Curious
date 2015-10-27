class GithubService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new('https://api.github.com/?access_token=ENV["CLIENT_ID"]')
  end

  def repos(current_user)
    parse(connection.get("#{current_user.nickname}/repos"))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
