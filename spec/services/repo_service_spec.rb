require 'rails_helper'

describe "Repo Service" do
  it "searches API for Github repositories" do
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
