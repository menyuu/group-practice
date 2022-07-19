class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @group_users = GroupUser.where(group_id: params[:id])
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

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
