class AssemblyBomsController < ApplicationController
  before_action :set_assembly_bom, only: [:show, :edit, :update, :destroy]

  # GET /assembly_boms
  # GET /assembly_boms.json
  def index
    @assembly_boms = AssemblyBom.all
  end

  # GET /assembly_boms/1
  # GET /assembly_boms/1.json
  def show
  end

  # GET /assembly_boms/new
  def new
    @assembly_bom = AssemblyBom.new
  end

  # GET /assembly_boms/1/edit
  def edit
  end

  # POST /assembly_boms
  # POST /assembly_boms.json
  def create
    @assembly_bom = AssemblyBom.new(assembly_bom_params)

    respond_to do |format|
      if @assembly_bom.save
        format.html { redirect_to @assembly_bom, notice: 'Assembly bom was successfully created.' }
        format.json { render action: 'show', status: :created, location: @assembly_bom }
      else
        format.html { render action: 'new' }
        format.json { render json: @assembly_bom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assembly_boms/1
  # PATCH/PUT /assembly_boms/1.json
  def update
    respond_to do |format|
      if @assembly_bom.update(assembly_bom_params)
        format.html { redirect_to @assembly_bom, notice: 'Assembly bom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @assembly_bom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assembly_boms/1
  # DELETE /assembly_boms/1.json
  def destroy
    @assembly_bom.destroy
    respond_to do |format|
      format.html { redirect_to assembly_boms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assembly_bom
      @assembly_bom = AssemblyBom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assembly_bom_params
      params.require(:assembly_bom).permit(:order_id, :business_id, :product, :kind, :onyx_p_n, :p_n, :name, :quantity, :remark)
    end
end
