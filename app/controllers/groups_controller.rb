class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @group_users = GroupUser.where(group_id: params[:id])
    end

  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    group.owner_id = current_user.id
    group.save
    group.users << current_user
    redirect_to groups_path
  end

  def group_tag_create
    group = Group.find(params[:group_id])
    tags = params[:group][:name].split(',')
    tags.each do |tag|
      tag = Tag.find_or_create_by(name: tag)
      group.tags << tag
    end
    redirect_to group_path(group)
  end

  def group_tag_update
    group = Group.find(params[:group_id])
    if params[:group][:tag_ids]
      get_tags = Tag.where(id: params[:group][:tag_ids])
      tags = []
      get_tags.each do |tag|
        tags.push(tag.name)
      end
      group.tag_save(tags)
      redirect_to group_path(group)
    else
      redirect_to group_path(group)
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
