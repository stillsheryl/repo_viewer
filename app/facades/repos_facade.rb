class ReposFacade

  def self.public_repos(user)
    response = Faraday.get("https://api.github.com/users/#{user}/repos?per_page=1000")

    repos = JSON.parse(response.body, symbolize_names: true)

    @repos = repos.map do |repo|
      Repo.new(repo)
    end
  end
end
