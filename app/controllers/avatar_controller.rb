class AvatarController < ApplicationController
  def new
    @avatar = Avatar.new
  end
end
