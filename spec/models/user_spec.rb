require 'rails_helper'

describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    auth = {
      uid: "12345678910",
      info: {
        nickname: "Shezza"
      },
      credentials: {
        token: "abcdefg12345"
      }
    }

    User.find_or_create_by(uid: auth[:uid]) do |user|
      user.username = auth[:info][:nickname]
      user.uid = auth[:uid]
      user.token = auth[:credentials][:token]
    end

    new_user = User.first

    expect(new_user.uid).to eq("12345678910")
    expect(new_user.username).to eq("Shezza")
    expect(new_user.token).to eq("abcdefg12345")
  end
end
