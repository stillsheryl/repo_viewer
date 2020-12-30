require 'rails_helper'

describe "Repo" do
  it "creates a Repo object" do
    data = {
      :id=>303454052,
      :name=>"activerecord-obstacle-course",
      :html_url=>"https://github.com/stillsheryl/activerecord-obstacle-course"
    }

    repo = Repo.new(data)

    expect(repo).to be_an_instance_of(Repo)

    expect(repo.name).to eq("activerecord-obstacle-course")
    expect(repo.url).to eq("https://github.com/stillsheryl/activerecord-obstacle-course")
  end
end
