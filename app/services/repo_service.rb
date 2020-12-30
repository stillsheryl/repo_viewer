class RepoService
  def self.public_repos(user)
    response = Faraday.get("https://api.github.com/users/#{user}/repos?per_page=1000")

    repos = JSON.parse(response.body, symbolize_names: true)
  end

  def self.private_repos(user, token)
    response = Faraday.get("https://api.github.com/user/repos?per_page=1000") do |req|
      req.headers['Authorization'] = "Bearer #{token}"
    end

    repos_data = JSON.parse(response.body, symbolize_names: true)

    repos = repos_data.find_all do |repo|
      repo[:private] == true
    end
  end
end
