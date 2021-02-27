class AvatarItemsController < ApplicationController
  def create
    AvatarItem.create!(avatar_id: params[:avatar_id], item_id: params[:item_id])
    redirect_to user_avatar_path(current_user, current_user.avatar)
  end
end
