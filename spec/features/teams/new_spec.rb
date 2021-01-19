require "rails_helper"

describe "new team page" do
  it "redirects to competition show page upon successful submission" do
    @comp = Competition.create(name: "Competition", location: "somewhere")
    visit new_competition_team_path(@comp.id)
    name_text = "sample text"
    hometown_text = "bwdaudgwaudg27"
    fill_in "team_nickname", with: name_text
    fill_in "team_hometown", with: hometown_text
    click_on "Register"

    expect(current_path).to eq(competition_path(@comp.id))
    within("#teams") do
      expect(page).to have_content(name_text)
      expect(page).to have_content(hometown_text)
    end
  end
end
