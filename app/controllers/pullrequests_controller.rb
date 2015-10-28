class PullrequestsController < ApplicationController
  def index
    @pull_requests = Github.new(current_user).pull_requests
  end
end
