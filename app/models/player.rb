class Player < ApplicationRecord
  belongs_to :team

  def self.average_age
    Player.average(:age)
  end
end
