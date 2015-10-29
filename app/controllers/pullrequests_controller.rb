class PullrequestsController < ApplicationController
  before_action :visitor

  def index
    @show = PullrequestDecorator.new(current_user)
  end
end
