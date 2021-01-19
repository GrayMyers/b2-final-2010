require "rails_helper"

describe Competition, type: :model do
  describe "relations" do
    it {should have_many :competition_teams}
    it {should have_many(:teams).through(:competition_teams)}
  end
end
