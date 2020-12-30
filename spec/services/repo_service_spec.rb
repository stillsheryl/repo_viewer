require 'rails_helper'

describe "Repo Service" do
  describe "public_repos" do
    it "searches API for public Github repositories" do
      user = "stillsheryl"

      results = RepoService.public_repos(user)

      expect(results).to be_an(Array)

      repo = results.first

      expect(repo).to have_key(:name)
      expect(repo).to have_key(:html_url)
      expect(repo[:name]).to be_a(String)
      expect(repo[:html_url]).to be_a(String)
    end
  end

  describe "private_repos" do
    xit "searches API for private Github repositories" do
      user = "stillsheryl"
      token = ""

      results = RepoService.private_repos(user, token)

      expect(results).to be_an(Array)

      repo = results.first

      expect(repo).to have_key(:name)
      expect(repo).to have_key(:html_url)
      expect(repo[:name]).to be_a(String)
      expect(repo[:html_url]).to be_a(String)
    end
  end
end
