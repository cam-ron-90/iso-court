class HearingsController < ApplicationController
  def index
    @hearings = Hearing.where(group: params[:group_id])
    # NEEDS TO BE SORTED BY REVERSE CHRONOLOGICAL ORDER
    # CURRENT HEARING SHOULDN'T BE DISPLAYED
  end

  def new
    @hearing = Hearing.new
  end

  def create
    @hearing = Hearing.new
    @hearing.group = Group.find(params[:group_id])

    if @hearing.save
      redirect_to new_group_commitment_path
    end
  end

  def show
    @hearing = Hearing.find(params[:id])
  end
end
