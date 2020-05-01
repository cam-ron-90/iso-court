class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new

    if params[:query]
      sql_query = "username ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = User.all
    end
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
