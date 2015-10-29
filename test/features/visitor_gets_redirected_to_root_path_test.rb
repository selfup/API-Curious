require "test_helper"
require "capybara"

class UserLogsInWithGithubTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "visitor tries to visit followers" do
    visit "/"
    assert_equal "/", current_path

    visit "/followers"
    assert_equal "/", current_path
    assert page.has_content?("You have not logged in!")
  end

  test "visitor tries to visit repos" do
    visit "/"
    assert_equal "/", current_path

    visit "/repos"
    assert_equal "/", current_path
    assert page.has_content?("You have not logged in!")
  end

  test "visitor tries to visit pullrequests" do
    visit "/"
    assert_equal "/", current_path

    visit "/pullrequests"
    assert_equal "/", current_path
    assert page.has_content?("You have not logged in!")
  end
end
