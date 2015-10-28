require './test/test_helper'

class GithubServiceTest < ActiveSupport::TestCase
  attr_reader :service, :user

  def setup
    @user ||= User.create(nickname: "selfup", uid: "github", token: ENV["TOKEN"])
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

  test '#followers' do
    VCR.use_cassette("github_service#followers") do
      followers = service.followers(user)
      follower = service.followers(user).first

      assert_equal 25, followers.count
      assert_equal 'Abouttabs', follower["login"]
    end
  end

  test '#organizations' do
    VCR.use_cassette("github_service#organizations") do
      organizations = service.organizations(user)
      organization = service.organizations(user).first

      assert_equal 0, organizations.count
    end
  end

  test '#pull_request_count' do
    VCR.use_cassette("github_service#pull_request_count") do
      pull_request_count = service.pull_request_count(user)

      assert_equal 0, pull_request_count.first
      assert_equal 28, pull_request_count.count
    end
  end
end
