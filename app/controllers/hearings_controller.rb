class HearingsController < ApplicationController
  def index
    hearings = Hearing.where(group: params[:group_id]).order(created_at: :desc)
    @group = Group.find(params[:group_id])
    @hearings = hearings - [@group.hearings.last]
    @current_hearing = @group.hearings.last
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


def filter_devices_id
      @filtered = {}
      @filtered[:device_id_not_supported] = params[:device_ids] - @devices.pluck(:id).map(&:to_s)
      @filtered[:no_email] = @devices.ids.select { |id| @devices.find(id)&.customer&.email.blank? }
      @devices = Device.where(id: @devices.pluck(:id) - @filtered[:no_email])
    end
