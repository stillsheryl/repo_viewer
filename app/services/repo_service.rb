class RepoService
  def self.public_repos(user)
    response = conn.get("/users/#{user}/repos")

    repos = JSON.parse(response.body, symbolize_names: true)
  end

  def self.private_repos(user, token)
    response = conn.get("/user/repos") do |req|
      req.headers['Authorization'] = "Bearer #{token}"
      req.params['visibility'] = 'private'
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.github.com') do |f|
      f.headers['Accept'] = 'application/json'
      f.params['per_page'] = 100
    end
  end
end
