class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def user_tag_create
    tags = params[:tag][:name].split(',')
    tags.each do |tag|
      tag = Tag.find_or_create_by(name: tag)
      current_user.tags << tag
    end
    redirect_to tags_path
  end

  def edit
  end

  def user_tag_update
    if params[:user][:tag_ids]
      get_tags = Tag.where(id: params[:user][:tag_ids])
      tags = []
      get_tags.each do |tag|
        tags.push(tag.name)
      end
      current_user.tag_save(tags)
      redirect_to tags_path
    else
      redirect_to tags_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, tag_ids: [])
  end
end
