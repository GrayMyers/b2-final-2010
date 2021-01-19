require "rails_helper"

describe Team, type: :model do
  describe "relations" do
    it {should have_many :players}
    it {should have_many :competition_teams}
  end

  describe "class methods" do
    before :each do

    end

    it "by_average_age" do
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

      expect(Team.by_average_age).to eq([@team3, @team2, @team1])
    end
  end
end
