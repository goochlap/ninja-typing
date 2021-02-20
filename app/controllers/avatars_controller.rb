class AvatarsController < ApplicationController
  def show; end

  def new
    unless current_user.avatar.nil?
      flash[:notice] = "You Already have an Avatar!"
      redirect_to root_path
    end
    @user = current_user
    @avatar = Avatar.new
  end

  def create
    @avatar = Avatar.new(avatar_params)
    @avatar.user = current_user
    if @avatar.save
      flash[:notice] = "Avatar successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  private

  def avatar_params
    params.require(:avatar).permit(:name, :gender)
  end
end
