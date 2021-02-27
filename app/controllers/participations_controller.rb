class ParticipationsController < ApplicationController
  def create
    Participation.create!(game_id: params[:game_id], board_id: params[:board_id])
    redirect_to game_path(params[:game_id])
  end
end
