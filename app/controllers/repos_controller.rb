class ReposController < ApplicationController
  def show
    response = Faraday.get("https://api.github.com/users/#{params[:user]}/repos")
    @repos = JSON.parse(response.body, symbolize_names: true)
  end
end
