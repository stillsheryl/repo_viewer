class ReposFacade
  def self.public_repos(user)
    repos = RepoService.public_repos(user)

    @repos = repos.map do |repo|
      Repo.new(repo)
    end
  end

  def self.private_repos(user, token)
    response = Faraday.get("https://api.github.com/user/repos?per_page=1000") do |req|
      req.headers['Authorization'] = "Bearer #{token}"
    end
    repos_data = JSON.parse(response.body, symbolize_names: true)

    repos = repos_data.find_all do |repo|
      repo[:private] == true
    end

    @repos = repos.map do |repo|
      Repo.new(repo)
    end
  end
end
