class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.admin = current_user
    params["group"]["user_ids"].each do |id|
      UserGroup.create(group: @group, user_id: id, status: "invited")
    end
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:name, :user_ids)
  end
end
