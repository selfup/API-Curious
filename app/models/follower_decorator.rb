class FollowerDecorator
  attr_reader :show

  def initialize(user)
    @show = Github.new(user)
  end

  def followers
    show.all_followers
  end

  def follower_events
    show.latest_followers_events
  end
end
