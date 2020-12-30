class ReposController < ApplicationController
  def show
    @repos = ReposFacade.public_repos(params[:user])
  end

  def show_private
    response = Faraday.get("https://api.github.com/user/repos?per_page=1000") do |req|
      req.headers['Authorization'] = "Bearer #{current_user.token}"
    end
    repos = JSON.parse(response.body, symbolize_names: true)

    @repos = repos.find_all do |repo|
      repo[:private] == true
    end
  end
end
