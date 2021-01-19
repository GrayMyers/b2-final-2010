require "rails_helper"

describe "competition show page" do
  before :each do
    @competition1 = Competition.create(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    @team1 = Team.create(nickname: "blue", hometown: "earth")
    @player1 = Player.create(name: "player 1", age: "12", team: @team1)
    @player2 = Player.create(name: "player 2", age: "10", team: @team1)
    @player3 = Player.create(name: "player 3", age: "8", team: @team1)

    @team2 = Team.create(nickname: "red", hometown: "the moon")
    @player4 = Player.create(name: "player 4", age: "30", team: @team2)
    @player5 = Player.create(name: "player 5", age: "31", team: @team2)
    @player6 = Player.create(name: "player 6", age: "33", team: @team2)

    @team3 = Team.create(nickname: "team not playing", hometown: "everywhere")
    @player7 = Player.create(name: "player 7", age: "200000000", team: @team3) #edge case to make sure players not included don't have their age added to average

    CompetitionTeam.create(team: @team1, competition: @competition1)
    CompetitionTeam.create(team: @team2, competition: @competition1)
    visit competition_path(@competition1.id)
  end

  it "has the properties of the competition listed on the page" do
    within("#competition-properties") do
      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition1.location)
      expect(page).to have_content(@competition1.sport)
    end
  end

  it "has the properties of each team participating listed on the page" do
    within("#teams") do
      within("#team-#{@team1.id}") do
        expect(page).to have_content(@team1.nickname)
        expect(page).to have_content(@team1.hometown)
      end
    end
  end

  it "has the average age of all players participating in the competition" do
    within("#avg-age") do
      puts(@competition1.players.average_age)
    end
  end

  it "has a link to register a team" do
    within("#registration-link") do
      click_on ("Register a team")
      expect(current_path).to eq(new_team_path)
    end
  end


end
