require "rails_helper"

describe "competitions index page" do
  before :each do
    @competition1 = Competition.new(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    @competition2 = Competition.new(name: "competition 2", location: "place where competition 2 is located", sport: "unspecified")
    @competition3 = Competition.new(name: "competition 3", location: "place where competition 3 is located", sport: "unspecified")
    visit competitions_path
  end

  it "has the names of competitions" do
    within("#all-competitions") do
      within("#comp-#{@competition1.id}") do
        expect(page).to have_content(@competition1.name)
      end

      within("#comp-#{@competition2.id}") do
        expect(page).to have_content(@competition2.name)
      end

      within("#comp-#{@competition3.id}") do
        expect(page).to have_content(@competition3.name)
      end
    end
  end

  it "has links for each competition's show page" do
    within("#all-competitions") do
      within("#comp-#{@competition1.id}") do
        click_on @competition1.name
        expect(current_path).to eq(competition_path(@competition1.id))
      end
      visit competitions_path
      within("#comp-#{@competition2.id}") do
        click_on @competition2.name
        expect(current_path).to eq(competition_path(@competition2.id))
      end
      visit competitions_path
      within("#comp-#{@competition3.id}") do
        click_on @competition3.name
        expect(current_path).to eq(competition_path(@competition3.id))
      end
    end
  end
end
