class ParticipationsController < ApplicationController
  def create
    @participation = Participation.new(participation_params)

    current_user.avatar.update(wallet: quantity)

    if @participation.save
      render json: { success: true }
    else
      render json: { success: false, errors: @participation.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def participation_params
    params.require(:participation).permit(:finished_in, :board_id, :game_id)
  end

  def quantity
    score = @participation.finished_in.to_i
    word_lenght = case params[:level_id]
                  when 1
                    3
                  when 2
                    4
                  when 3
                    5
                  else
                    6
                  end
    current_user.avatar.wallet + (score / word_lenght.to_f).to_i
  end
end
