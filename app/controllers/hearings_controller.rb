class HearingsController < ApplicationController
  def show
    @hearing = Hearing.find(params[:id])
  end
end
