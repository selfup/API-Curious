require_relative 'services/github_service'

class Repo < OpenStruct # only use this if you don't want to define the hash keys as data objects
  def self.service
    require 'pry' ; binding.pry
    @service ||= GithubService.new
  end

  def self.all
    service.repos.map { |repo| Repo.new(repo) }
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
