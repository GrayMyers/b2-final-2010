require "rails_helper"

describe "team index page" do

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
    @player7 = Player.create(name: "player 7", age: "200000000", team: @team3)

    CompetitionTeam.create(team: @team1, competition: @competition1)
    CompetitionTeam.create(team: @team2, competition: @competition1)
    CompetitionTeam.create(team: @team3, competition: @competition1)
    
    visit competition_teams_path(@competition1.id)
  end

  it "has all teams listed with their average player age" do
    within("#teams") do
      within("#team-#{@team1.id}") do
        expect(page).to have_content(@team1.nickname)
        expect(page).to have_content(@team1.players.average_age)
      end

      within("#team-#{@team2.id}") do
        expect(page).to have_content(@team2.nickname)
        expect(page).to have_content(@team2.players.average_age)
      end

      within("#team-#{@team3.id}") do
        expect(page).to have_content(@team3.nickname)
        expect(page).to have_content(@team3.players.average_age)
      end
    end
  end

  it "lists teams in order by their average player age from highest to lowest" do
    team1 = page.find("#team-#{@team1.id}")
    team2 = page.find("#team-#{@team2.id}")
    team3 = page.find("#team-#{@team3.id}")

    expect(team3).to appear_before(team2)
    expect(team2).to appear_before(team1)
  end


end
