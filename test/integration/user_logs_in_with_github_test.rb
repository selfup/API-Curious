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

  test "logging in" do
    VCR.use_cassette("github_service#login") do
      visit "/"
      assert_equal 200, page.status_code
      click_link "login"
      assert_equal "/", current_path
      assert page.has_content?("LeHub")
      assert page.has_link?("logout")
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
