class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    tag = Tag.find_or_create_by(tag_params)
    if current_user.tag_users.find_by(tag_id: tag.id)
      return redirect_to users_path
    else
      tag_user = TagUser.new
      tag_user.tag_id = tag.id
      tag_user.user_id = current_user
      current_user.tags.push(tag)
      redirect_to tags_path
    end
  end

  def edit
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
