require "test_helper"
require "capybara"

class UserLogsInWithGithubTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader :user

  def setup
    Capybara.app = OauthWorkshop::Application
    stub_omniauth
    @user ||= User.create(nickname: "selfup", uid: "github", token: ENV["TOKEN"])
  end

  test "a user logs in and sees accurate data" do
    VCR.use_cassette("github_service#login") do
      visit "/"
      assert_equal 200, page.status_code
      click_link "login"
      assert_equal "/", current_path
      assert page.has_content?("LeHub")
      assert page.has_content?("Le Selfup")
      assert page.has_link?("logout")
      assert page.has_content?("1067")
      assert page.has_content?("33")
      assert page.has_content?("Following")
      assert page.has_content?("Followed by")
      assert page.has_content?("From")
      assert page.has_content?("Current Streak")
      assert page.has_content?("Longest Streak")
      assert page.has_content?("Year to Date")
    end
  end

  test "a user logs in goes to repos and sees a repo they own" do
    VCR.use_cassette("github_service#login") do
      VCR.use_cassette("github_service#repos") do
        visit "/"
        assert_equal 200, page.status_code
        click_link "login"
        assert_equal "/", current_path
        assert page.has_content?("LeHub")
        assert page.has_content?("Le Selfup")

        visit "/repos"
        assert page.has_content?("API-Curious")
      end
    end
  end

  test "a user logs in goes to followers and sees a follower they follow" do
    VCR.use_cassette("github_service#login") do
      VCR.use_cassette("github_service#followers") do
        VCR.use_cassette("github_service#latest_follower_events") do
          visit "/"
          assert_equal 200, page.status_code
          click_link "login"
          assert_equal "/", current_path
          assert page.has_content?("LeHub")
          assert page.has_content?("Le Selfup")

          visit "/followers"
          assert_equal "/followers", current_path
          assert page.has_content?("Abouttabs")
          assert page.has_content?("IssueCommentEvent")
        end
      end
    end
  end

  def stub_omniauth

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
        info: {
          nickname: "selfup",
          email: "boudinot.regis@yahoo.com"
        },
      credentials: {
        token: ENV["TOKEN"],
      },
      extra: {
        raw_info: {

        }
      }
    })
  end
end
