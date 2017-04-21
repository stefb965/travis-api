module Travis::API::V3
  class Queries::Branch < Query
    params :name
    params :recent_builds, prefix: :branch

    def find(repository)
      return repository.branch(name) if name
      raise WrongParams, 'missing branch.name'.freeze
    end
  end
end
