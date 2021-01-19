require "rails_helper"
describe Player, type: :model do
  describe "relations" do
    it {should belong_to :team}
  end

  describe "class methods" do

    it "average_age" do
      expect(Player.average_age).to eq(nil) #edge case (expect it not to error when called with no players)

      @team1 = Team.create(nickname: "team 1", location: "somewhere")
      @player1 = Player.create(name: "player 1", age: 12, team: @team1)
      @player2 = Player.create(name: "player 2", age: 13, team: @team1)
      @player3 = Player.create(name: "player 3", age: 14, team: @team1)

      expect(Player.average_age).to eq(13)
      @player5 = Player.create(name: "player 5", age: 16, team: @team1)

      expect(Player.average_age).to sq(13.75) #edge case
    end
  end
end
