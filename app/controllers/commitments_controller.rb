class CommitmentsController < ApplicationController
    before_action :set_commitment, only: [:edit, :update, :destroy]

  def new
    @commitment = Commitment.new
  end

  def create
    @commitment = Commitment.new(commitment_params)

    if @commitment.save
      redirect_to request.referer
    else
      render :new
    end
  end

  def edit
  end

  def update
    @commitment.update(commitment_params)

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
    params.require(:commitment).permit(:category, :description, :status)
  end
end
