class ChargesController < ApplicationController
  before_action :set_charge, only: :destroy

  def new
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(charge_params)
    @charge.group = Group.find(params[:user_id])
    @charge.hearing = Group.find(params[:user_id]).hearings.last
    @user = User.find(params[:user_id])
    group_users  = Group.find(params[:id]).users.all.collect{ |x| x.username }
    @charge.judge = (group_users.select{ |x| x != @user.username }).sample
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
