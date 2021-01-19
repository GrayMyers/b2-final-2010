require "rails_helper"

describe CompetitionTeam, type: :model do
  describe "relations" do
    it {should belong_to :team}
    it {should belong_to :competition}
  end
end
