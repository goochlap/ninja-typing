class ParticipationsController < ApplicationController
  def create
    participation = Participation.create!(participation_params)

    if participation.finished_in.to_i < 10
      current_user.avatar.update(wallet: quantity(5))
    else
      current_user.avatar.update(wallet: quantity(10))
    end

    if participation.save
      render json: { success: true }
    else
      render json: { success: false, errors: participation.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def participation_params
    params.require(:participation).permit(:finished_in, :board_id, :game_id)
  end

  def quantity(number)
    current_user.avatar.wallet + number
  end
end
