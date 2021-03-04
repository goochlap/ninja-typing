class BoardsController < ApplicationController
  def show
    @games = Game.all
  end
end
