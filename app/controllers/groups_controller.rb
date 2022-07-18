class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Grop.new
  end
end
