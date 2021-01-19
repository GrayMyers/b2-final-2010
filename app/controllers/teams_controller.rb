class TeamsController < ApplicationController

  def index
    comp = Competition.find(params[:competition_id])
    @teams = comp.teams.by_average_age
  end

  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    team = Team.create(team_params)
    comp = Competition.find(params[:competition_id])
    CompetitionTeam.create(team: team, competition: comp)
    redirect_to competition_path(params[:competition_id])
  end

  private

  def team_params
    params.require(:team).permit(:nickname, :hometown)
  end
end
