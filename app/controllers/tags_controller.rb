class TagsController < ApplicationController
  def index
    @tags = Tag.all
    tags = current_user.tags.all
    @user_tags = tags.pluck(:name).join(",")
  end

  def create
    tags = params[:tag][:name].split(',')
    current_tags = current_user.tags.pluck(:name) unless current_user.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags
    old_tags.each do |old|
      tags.delete Tag.find_by(name: old)
    end
    new_tags.each do |new|
      tag = Tag.find_or_create_by(name: new)
      current_user.tags << tag
    end
    redirect_to tags_path
  end

  def edit
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
