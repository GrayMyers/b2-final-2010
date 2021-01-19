require "rails_helper"

describe "new team page" do
  it "redirects to competition show page upon successful submission" do
    @comp = Competition.create(name: "Competition", location: "somewhere")

    within("#creation-form") do
      name_text = "sample text"
      hometown_text = "bwdaudgwaudg27"
      fill_in(:nickname).with(name_text)
      fill_in(:hometown).with(hometown_text)
      click_on "Register"

      expect(current_path).to eq(competition_path(@comp.id))
      within("#teams") do
        expect(page).to have_content(name_text)
        expect(page).to have_content(hometown_text)
      end
    end
  end
end
