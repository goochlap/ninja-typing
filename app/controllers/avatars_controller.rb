class AvatarsController < ApplicationController
  before_action :find_avatar, only: %i[edit update show]

  def show
    unless @avatar.avatar_items.find_by(choosen: true).nil?

      @avatar_item_image = @avatar.avatar_items.find_by(choosen: true).item.image
      unless Item.find((@avatar.avatar_items.where(choosen: true).pluck(:item_id) & Category.find_by(name: 'Arme').items.pluck(:id))).empty?
        @avatar_weapon_image = Item.find((@avatar.avatar_items.where(choosen: true).pluck(:item_id) & Category.find_by(name: 'Arme').items.pluck(:id)).first).image
      end
      unless Item.find((@avatar.avatar_items.where(choosen: true).pluck(:item_id) & Category.find_by(name: 'Ruban').items.pluck(:id))).empty?
        @avatar_ribbon_image = Item.find((@avatar.avatar_items.where(choosen: true).pluck(:item_id) & Category.find_by(name: 'Ruban').items.pluck(:id)).first).image
      end
      unless Item.find((@avatar.avatar_items.where(choosen: true).pluck(:item_id) & Category.find_by(name: 'Insigne').items.pluck(:id))).empty?
        @avatar_badge_image = Item.find((@avatar.avatar_items.where(choosen: true).pluck(:item_id) & Category.find_by(name: 'Insigne').items.pluck(:id)).first).image
      end

    end
  end

  def new
    unless current_user.avatar.nil?
      flash[:notice] = "You Already have an Avatar!"
      redirect_to user_avatar_path(current_user, current_user.avatar)
    end
    @user = current_user
    @avatar = Avatar.new
  end

  def create
    @avatar = Avatar.new(avatar_params)
    @avatar.user = current_user
    if @avatar.save
      Board.create(avatar: @avatar)
      flash[:notice] = "Avatar successfully created"
      redirect_to user_avatar_board_path(current_user, current_user.avatar, current_user.avatar.board)

    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  def edit; end

  def update
    @avatar.update(avatar_params)
    redirect_to user_avatar_path(current_user, current_user.avatar)
  end

  private

  def find_avatar
    @avatar = Avatar.find(params[:id])
  end

  def avatar_params
    params.require(:avatar).permit(:name, :gender, :wallet)
  end
end
