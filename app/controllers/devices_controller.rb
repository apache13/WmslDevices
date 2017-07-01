class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    #@devices = Device.all
    #@devices = Device.paginate(:page => params[:page])
    if params[:name].present? && params[:code].present?
        @devices = Device.where("name like ?","%#{params[:name]}%").where("code like ?","%#{params[:code]}%").paginate(:page => params[:page])
    else
      if params[:name].present?
        @devices = Device.where("name like ?","%#{params[:name]}%").paginate(:page => params[:page])
      else
        if params[:code].present?
          @devices = Device.where("code like ?","%#{params[:code]}%").paginate(:page => params[:page])
        else
          @devices = Device.paginate(:page => params[:page])
        end 
      end
    end
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    begin
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
    rescue ActiveRecord::DeleteRestrictionError
        respond_to do |format|
        format.html { redirect_to devices_url, notice: 'Cannot delete record because of dependent enrolls.' }
        format.json { head :no_content }
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:name, :code)
    end
end
