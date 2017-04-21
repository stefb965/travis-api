module Travis::API::V3
  class Services::Branch::Find < Service
    params :recent_builds, prefix: :branch
    def run!
      result find(:branch, find(:repository))
    end
  end
end
