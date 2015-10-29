class PullrequestsController < ApplicationController
  def index
    @show = PullrequestDecorator.new(current_user)
  end
end
