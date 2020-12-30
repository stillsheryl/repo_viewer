class ReposController < ApplicationController
  def show
    @repos = ReposFacade.public_repos(params[:user])
  end

  def show_private
    @repos = ReposFacade.private_repos(params[:user], current_user.token)
  end
end
