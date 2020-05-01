class UserChargeController < ApplicationController
  def update
    @usercharge = UserCharge.find(params[:id])
    @usercharge.update(verdict: "Not guilty")

    redirect_to request.referer
  end
end
