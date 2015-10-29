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

  test '#lastest_follower_events' do
    VCR.use_cassette("github_service#followers") do
      VCR.use_cassette("github_service#latest_follower_events") do
        follower_events = service.latest_followers_events(user)
        follower_event = service.latest_followers_events(user).first

        assert_equal 25, follower_events.count
        assert_equal "IssueCommentEvent", follower_event.first["type"]
      end
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

      assert_equal 1, pull_request_count.first
      assert_equal 28, pull_request_count.count
    end
  end

  test '#starred_repos_count' do
    VCR.use_cassette("github_service#starred_repos_count") do
      starred_repos = service.starred_repos(user)

      assert_equal 30, starred_repos
    end
  end

  test '#latest_followers_events' do
    VCR.use_cassette("github_service#latest_followers_events") do
      latest_followers_event = service.latest_followers_events(user)

      assert_equal Array, latest_followers_event.class
    end
  end
end
