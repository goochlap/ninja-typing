class AvatarsController < ApplicationController
  before_action :find_avatar, only: %i[edit update show]

  def show; end

  def edit; end

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
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def update
    @avatar.update(avatar_params)
    redirect_to user_avatar_path(current_user, current_user.avatar)
  end

  private

  def find_avatar
    @avatar = Avatar.find(params[:id])
  end

  def avatar_params
    params.require(:avatar).permit(:name, :gender)
  end
end
