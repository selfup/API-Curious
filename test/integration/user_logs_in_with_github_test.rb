require "test_helper"
require "capybara"

# class UserLogsInWithGithubTest < ActionDispatch::IntegrationTest
#   include Capybara::DSL
#   def setup
#     Capybara.app = OauthWorkshop::Application
#     stub_omniauth
#   end
#
#   test "logging in" do
#     visit "/"
#     assert_equal 200, page.status_code
#     click_link "login"
#     assert_equal "/", current_path
#     assert page.has_content?("Horace")
#     assert page.has_link?("logout")
#   end
#
#   def stub_omniauth
#
#     OmniAuth.config.test_mode = true
#
#     OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
#       provider: 'github',
#       extra: {
#         raw_info: {
#           user_id: "1",
#           nickname: "worace",
#         }
#       },
#       credentials: {
#         token: ENV["TOKEN"],
#       }
#     })
#   end
# end
