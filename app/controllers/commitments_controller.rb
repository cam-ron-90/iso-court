class CommitmentsController < ApplicationController
    before_action :set_commitment, only: [:edit, :update, :destroy]

  def new
    @commitment = Commitment.new
    @group = Group.find(params[:group_id])
  end

  def create
    @commitment = Commitment.new(commitment_params)
    @commitment.group = Group.find(params[:group_id])
    @commitment.hearing = @commitment.group.hearings.last
    @user_commitment = UserCommitment.new

    @user = User.find(params[:commitment][:user_ids])

    if @commitment.save
      @user_commitment.commitment = @commitment
      @user_commitment.user = @user
      @user_commitment.save!

      redirect_to request.referer
    else
      render :new
    end
  end

  def edit
  end

  def update
    @commitment.update(status: 'Complete')

    redirect_to request.referer
  end

  def destroy
    @commitment.destroy

    redirect_to request.referer
  end

  private

  def set_commitment
    @commitment = Commitment.find(params[:id])
  end

  def commitment_params
    params.require(:commitment).permit(:category, :description, :status, :user_id, :group_id, :hearing_id)
  end
end
