class PullrequestsController < ApplicationController
  def index
    @show = PullrequestDecorator.new(current_user)
    # @repos         = Github.new(current_user).all_repos
    # @pull_requests = Github.new(current_user).pull_requests
  end
end
