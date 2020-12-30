require 'rails_helper'

describe "As a visitor when I log in" do
  xit "shows a welcome message" do
    stub_omniauth

    visit root_path

    click_on "Login with Github"

    expect(page).to have_content("Welcome, Shezza!")
  end

  def stub_omniauth
      OmniAuth.config.test_mode = true

      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        uid: "12345678910",
        info: {
          username: "Shezza"
        },
        credentials: {
          token: "abcdefg12345"
        }
      })
    end
end
