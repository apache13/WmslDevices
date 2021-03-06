class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  # GET /staffs
  # GET /staffs.json
  def index
    #@staffs = Staff.all
    #@staffs = Staff.paginate(:page => params[:page])
    if params[:name].present? && params[:code].present?
        @staffs = Staff.where("name like ?","%#{params[:name]}%").where("code like ?","%#{params[:code]}%").paginate(:page => params[:page])
    else
      if params[:name].present?
        @staffs = Staff.where("name like ?","%#{params[:name]}%").paginate(:page => params[:page])
      else
        if params[:code].present?
          @staffs = Staff.where("code like ?","%#{params[:code]}%").paginate(:page => params[:page])
        else
          @staffs = Staff.paginate(:page => params[:page])
        end 
      end
    end
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to @staff, notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    begin
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
    rescue ActiveRecord::DeleteRestrictionError
        respond_to do |format|
        format.html { redirect_to staffs_url, notice: 'Cannot delete record because of dependent enrolls.' }
        format.json { head :no_content }
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:name, :code, :department)
    end
end
