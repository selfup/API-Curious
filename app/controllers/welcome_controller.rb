class WelcomeController < ApplicationController
  def index
    if current_user == nil
      current_user
    else
      @info = WelcomeDecorator.new(current_user)
    end
  end
end
