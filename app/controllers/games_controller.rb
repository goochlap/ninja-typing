class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @level = params[:level]
  end
end
