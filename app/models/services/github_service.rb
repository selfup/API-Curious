class SchoolistService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.github.com/")
  end

  def repos
    parse(connection.get("repos"))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
