class BomMaterialesController < ApplicationController
  before_action :set_bom_materiale, only: [:show, :edit, :update, :destroy]

  # GET /bom_materiales
  # GET /bom_materiales.json
  def index
    @bom_materiales = BomMateriale.all
  end

  # GET /bom_materiales/1
  # GET /bom_materiales/1.json
  def show
  end

  # GET /bom_materiales/new
  def new
    @bom_materiale = BomMateriale.new
  end

  # GET /bom_materiales/1/edit
  def edit
  end

  # POST /bom_materiales
  # POST /bom_materiales.json
  def create
    @bom_materiale = BomMateriale.new(bom_materiale_params)

    respond_to do |format|
      if @bom_materiale.save
        format.html { redirect_to @bom_materiale, notice: 'Bom materiale was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bom_materiale }
      else
        format.html { render action: 'new' }
        format.json { render json: @bom_materiale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bom_materiales/1
  # PATCH/PUT /bom_materiales/1.json
  def update
    respond_to do |format|
      if @bom_materiale.update(bom_materiale_params)
        format.html { redirect_to @bom_materiale, notice: 'Bom materiale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bom_materiale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bom_materiales/1
  # DELETE /bom_materiales/1.json
  def destroy
    @bom_materiale.destroy
    respond_to do |format|
      format.html { redirect_to bom_materiales_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bom_materiale
      @bom_materiale = BomMateriale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bom_materiale_params
      params.require(:bom_materiale).permit(:onyx_p_n, :type, :description, :p_n, :substitute_code, :substitute_p_n, :reference, :footprint, :mark, :substitute_mark, :remark, :manufacture, :quantity, :document, :version, :state)
    end
end
