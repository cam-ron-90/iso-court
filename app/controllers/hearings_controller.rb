class HearingsController < ApplicationController
  def index
    @hearings = Hearing.where(group: params[:group_id])
    # NEEDS TO BE SORTED BY REVERSE CHRONOLOGICAL ORDER
    # CURRENT HEARING SHOULDN'T BE DISPLAYED
  end

  def show
    @hearing = Hearing.find(params[:id])
  end
end
