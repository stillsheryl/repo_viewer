class RepoService
  def self.public_repos(user)
    response = Faraday.get("https://api.github.com/users/#{user}/repos?per_page=100")

    repos = JSON.parse(response.body, symbolize_names: true)
  end

  def self.private_repos(user, token)
    response = Faraday.get("https://api.github.com/user/repos") do |req|
      req.headers['Authorization'] = "Bearer #{token}"
      req.params['visibility'] = 'private'
      req.params['per_page'] = 100
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
