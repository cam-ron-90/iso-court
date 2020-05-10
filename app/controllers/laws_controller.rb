class LawsController < ApplicationController
  def new
    @law = Law.new
  end

  def create
    @law = Law.new(law_params)
    @law.group = Group.find(params[:group_id])

    if @law.save
      redirect_to group_path(@law.group)
    else
      render 'groups/show'
    end
  end

  def destroy
  end

  private

  def law_params
    params.require(:law).permit(:name, :group_id)
  end
end
