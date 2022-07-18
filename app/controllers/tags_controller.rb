class TagsController < ApplicationController
  def index
    @user = current_user
    @tags = Tag.all
    tags = current_user.tags.all
    @user_tags = tags.pluck(:name).join(",")
  end

  def create
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
