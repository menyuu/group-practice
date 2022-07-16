class UsersController < ApplicationController
  def edit
  end

  def update
    tags = params[:user][:name].split(',')
    current_tags = current_user.tags.pluck(:name) unless current_user.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags
    old_tags.each do |old|
      current_user.tags.delete Tag.find_by(name: old)
    end
    new_tags.each do |new|
      tag = Tag.find_or_create_by(name: new)
      current_user.tags << tag
    end
    redirect_to tags_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
