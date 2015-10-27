class Repo < OpenStruct # only use this if you don't want to define the hash keys as data objects
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def service
    @service ||= GithubService.new(user)
  end

  def all
    # require 'pry' ; binding.pry
    service.repos(user).map { |repo| repo }
  end

  def self.find(id)
    Repo.new(service.repos(id))
  end

  def self.find(name)
    Repo.new(service.repo(name))
  end

  def self.create(params)
    Repo.new(service.create(params))
  end
end
