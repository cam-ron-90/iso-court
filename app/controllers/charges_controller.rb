class ChargesController < ApplicationController
  before_action :set_charge, only: :destroy

  def new
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(charge_params)
    @charge.group = Group.find(params[:group_id])
    @charge.hearing = @charge.group.hearings.last
    @user = User.find(params[:charge][:user_ids].to_i)
    @charge.judge  = @charge.group.users.all.select{ |x| x != @user }.sample
    @user_charge = UserCharge.new

    if @charge.save
      @user_charge.charge = @charge
      @user_charge.user = @user
      @user_charge.save

      redirect_to request.referer
    else
      render :new
    end
  end

  def edit
  end

  def update
    @charge.update(verdict: 'Not Guilty')

    redirect_to court_path(params[:group_id])
  end

  def destroy
    @charge.destroy

    redirect_to court_path(params[:group_id])
  end

  private

  def set_charge
    @charge = Charge.find(params[:id])
  end

  def charge_params
    params.require(:charge).permit(:category, :description, :verdict, :user_id, :group_id, :hearing_id)
  end
end
