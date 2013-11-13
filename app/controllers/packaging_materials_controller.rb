class PackagingMaterialsController < ApplicationController
  before_action :set_packaging_material, only: [:show, :edit, :update, :destroy]

  # GET /packaging_materials
  # GET /packaging_materials.json
  def index
    @packaging_materials = PackagingMaterial.all
  end

  # GET /packaging_materials/1
  # GET /packaging_materials/1.json
  def show
  end

  # GET /packaging_materials/new
  def new
    @packaging_material = PackagingMaterial.new
  end

  # GET /packaging_materials/1/edit
  def edit
  end

  # POST /packaging_materials
  # POST /packaging_materials.json
  def create
    @packaging_material = PackagingMaterial.new(packaging_material_params)

    respond_to do |format|
      if @packaging_material.save
        format.html { redirect_to @packaging_material, notice: 'Packaging material was successfully created.' }
        format.json { render action: 'show', status: :created, location: @packaging_material }
      else
        format.html { render action: 'new' }
        format.json { render json: @packaging_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packaging_materials/1
  # PATCH/PUT /packaging_materials/1.json
  def update
    respond_to do |format|
      if @packaging_material.update(packaging_material_params)
        format.html { redirect_to @packaging_material, notice: 'Packaging material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @packaging_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packaging_materials/1
  # DELETE /packaging_materials/1.json
  def destroy
    @packaging_material.destroy
    respond_to do |format|
      format.html { redirect_to packaging_materials_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_packaging_material
      @packaging_material = PackagingMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def packaging_material_params
      params.require(:packaging_material).permit(:box, :inside_box, :dust_proof_bag, :warranty_card, :quick_help, :help, :serial_number, :ean13_code, :remark)
    end
end
