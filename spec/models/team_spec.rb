require "rails_helper"

describe Team, type: :model do
  describe "relations" do
    it {should have_many :players}
    it {should have_many :competition_teams}
  end
end
