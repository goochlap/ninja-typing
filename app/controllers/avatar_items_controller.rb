class AvatarItemsController < ApplicationController
  def create
    avatar = Avatar.find(params[:avatar_id])
    item_price = Item.find(params[:item_id]).price
    if avatar.wallet >= item_price
      avatar_item = AvatarItem.create!(avatar_id: params[:avatar_id], item_id: params[:item_id])
      unless (avatar.avatar_items.where(choosen: true).pluck(:item_id) & Category.find_by(name: avatar_item.item.category.name).items.pluck(:id)).empty?
        item = Item.find((avatar.avatar_items.where(choosen: true).pluck(:item_id) & Category.find_by(name: avatar_item.item.category.name).items.pluck(:id)).first)
      end
      avatar_item_choosen = AvatarItem.find_by(avatar_id: params[:avatar_id], item_id: item.id) unless item.nil?
      avatar_item.update(choosen: true)
      avatar_item_choosen.update(choosen: false) unless avatar_item_choosen.nil?
      avatar.update(wallet: avatar.wallet - item_price)
      redirect_to user_avatar_path(current_user, current_user.avatar)
    else
      redirect_to items_path, alert: "Vous n'avez pas assez d'argent"
    end
  end

  def validate
    avatar = Avatar.find(params[:avatar_id])
    avatar_item = AvatarItem.find_by(avatar_id: params[:avatar_id], item_id: params[:item_id])
    unless (avatar.avatar_items.where(choosen: true).pluck(:item_id) & Category.find_by(name: avatar_item.item.category.name).items.pluck(:id)).empty?
      item = Item.find((avatar.avatar_items.where(choosen: true).pluck(:item_id) & Category.find_by(name: avatar_item.item.category.name).items.pluck(:id)).first)
    end
    avatar_item_choosen = AvatarItem.find_by(avatar_id: params[:avatar_id], item_id: item.id) unless item.nil?
    avatar_item.update(choosen: true)
    avatar_item_choosen.update(choosen: false) unless avatar_item_choosen.nil?
    redirect_to user_avatar_path(params[:avatar_id])
  end
end
