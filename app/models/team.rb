class Team < ApplicationRecord
  has_many :competition_teams
  has_many :competitions, through: :competition_teams
  has_many :players

  def self.by_average_age #this would ideally be done using scopes, but ran out of time to implement that
    Team.joins(:players).group(:id).select("teams.*, avg(players.age) as avg_age").order("avg_age DESC")
  end
end
