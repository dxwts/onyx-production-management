class ManufacturesController < ApplicationController
  before_action :set_manufacture, only: [:show, :edit, :update, :destroy]

  # GET /manufactures
  # GET /manufactures.json
  def index
    @manufactures = Manufacture.all
  end

  # GET /manufactures/1
  # GET /manufactures/1.json
  def show
  end

  # GET /manufactures/new
  def new
    @manufacture = Manufacture.new
  end

  # GET /manufactures/1/edit
  def edit
  end

  # POST /manufactures
  # POST /manufactures.json
  def create
    @manufacture = Manufacture.new(manufacture_params)

    respond_to do |format|
      if @manufacture.save
        format.html { redirect_to @manufacture, notice: 'Manufacture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @manufacture }
      else
        format.html { render action: 'new' }
        format.json { render json: @manufacture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manufactures/1
  # PATCH/PUT /manufactures/1.json
  def update
    respond_to do |format|
      if @manufacture.update(manufacture_params)
        format.html { redirect_to @manufacture, notice: 'Manufacture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @manufacture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufactures/1
  # DELETE /manufactures/1.json
  def destroy
    @manufacture.destroy
    respond_to do |format|
      format.html { redirect_to manufactures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manufacture
      @manufacture = Manufacture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manufacture_params
      params.require(:manufacture).permit(:name, :address, :tel, :remark)
    end
end
