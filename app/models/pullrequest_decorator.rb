class PullrequestDecorator
  attr_reader :show

  def initialize(user)
    @show = Github.new(user)
  end

  def repos
    show.all_repos
  end

  def open_pull_requests
    show.pull_requests
  end
end
