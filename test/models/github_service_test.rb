require './test/test_helper'

class GithubServiceTest < ActiveSupport::TestCase
  attr_reader :service, :user

  def setup
    @user = User.create(nickname: "selfup", uid: "github", token: ENV["TOKEN"])
    @service ||= GithubService.new(user)
  end

  test '#repos' do
    VCR.use_cassette("github_service#repos") do
      repos = service.repos(user)
      repo = service.repos(user).first

      assert_equal 28, repos.count
      assert_equal 'API-Curious', repo["name"]
    end
  end
end
