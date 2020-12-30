require 'rails_helper'

describe "ReposFacade" do
  describe "public_repos" do
    it "returns an array of repo ojects for a given user" do
      user = "stillsheryl"

      repos = ReposFacade.public_repos(user)

      expect(repos).to be_an(Array)

      first_repo = repos.first

      expect(first_repo).to be_a(Repo)
      expect(first_repo.name).to be_a(String)
      expect(first_repo.url).to be_a(String)
    end
  end

  describe "private_repos" do
    it "returns an array of repo ojects for a given user" do
      user = "stillsheryl"

      repos = ReposFacade.public_repos(user)

      expect(repos).to be_an(Array)

      first_repo = repos.first

      expect(first_repo).to be_a(Repo)
      expect(first_repo.name).to be_a(String)
      expect(first_repo.url).to be_a(String)
    end
  end
end
