class ReposFacade

  def self.public_repos(user)
    repos = RepoService.public_repos(user)

    @repos = repos.map do |repo|
      Repo.new(repo)
    end
  end
end
