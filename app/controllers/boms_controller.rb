class BomsController < ApplicationController
  before_action :set_bom, only: [:show, :edit, :update, :destroy, :materiales_list, :add_materiale_to_bom, :remove_materiale_from_materiales_list]

  # GET /boms
  # GET /boms.json
  def index
    @boms = Bom.all
  end

  # GET /boms/1
  # GET /boms/1.json
  def show
  end

  # GET /boms/new
  def new
    @bom = Bom.new
  end

  # GET /boms/1/edit
  def edit
  end

  # POST /boms
  # POST /boms.json
  def create
    @bom = Bom.new(bom_params)
    @bom.product_id = bom_params["product_id"]
    respond_to do |format|
      if @bom.save
        format.html { redirect_to @bom, notice: 'Bom was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bom }
      else
        format.html { render action: 'new' }
        format.json { render json: @bom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boms/1
  # PATCH/PUT /boms/1.json
  def update
    respond_to do |format|
      if @bom.update(bom_params)
        format.html { redirect_to @bom, notice: 'Bom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boms/1
  # DELETE /boms/1.json
  def destroy
    @bom.destroy
    respond_to do |format|
      format.html { redirect_to boms_url }
      format.json { head :no_content }
    end
  end
  
  def materiales_list
    @materiales = Materiale.all
    respond_to do |format|
      format.html {render action: "materiales_list"}
    end
  end
  
  def add_materiale_to_bom
    @materiale = Materiale.find(params[:materiale_id])
    @bom_materiale = BomMateriale.new
    @materiale.bom_materiales << @bom_materiale
    @bom.bom_materiales << @bom_materiale
    @materiale.add_bom(@bom)
    respond_to do |format|
      format.js {@materiale}
    end
  end
  
  def remove_materiale_from_materiales_list
    @materiale = Materiale.find(params[:materiale_id])
    @bom.bom_materiales.find_by(:materiale_id => params[:materiale_id]).destroy
    @materiale.remove_bom(@bom)
    respond_to do |format|
      format.js {@materiale}
    end
  end
  
  def remove_materiale_from_bom
      @bom_materiale = BomMateriale.find(params[:bom_materiale_id])
      @bom_materiale.materiale.remove_bom(@bom_materiale.bom)
      @bom_materiale.destroy
      respond_to do |format|
      format.js {@bom_materiale}
    end   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bom
      @bom = Bom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bom_params
      params.require(:bom).permit(:bom_id, :version, :state, :product_id, :materiale_id)
    end
end
