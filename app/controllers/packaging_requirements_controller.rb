class PackagingRequirementsController < ApplicationController
  before_action :set_packaging_requirement, only: [:show, :edit, :update, :destroy]

  # GET /packaging_requirements
  # GET /packaging_requirements.json
  def index
    @packaging_requirements = PackagingRequirement.all
  end

  # GET /packaging_requirements/1
  # GET /packaging_requirements/1.json
  def show
  end

  # GET /packaging_requirements/new
  def new
    @packaging_requirement = PackagingRequirement.new
  end

  # GET /packaging_requirements/1/edit
  def edit
  end

  # POST /packaging_requirements
  # POST /packaging_requirements.json
  def create
    @packaging_requirement = PackagingRequirement.new(packaging_requirement_params)

    respond_to do |format|
      if @packaging_requirement.save
        format.html { redirect_to @packaging_requirement, notice: 'Packaging requirement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @packaging_requirement }
      else
        format.html { render action: 'new' }
        format.json { render json: @packaging_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packaging_requirements/1
  # PATCH/PUT /packaging_requirements/1.json
  def update
    respond_to do |format|
      if @packaging_requirement.update(packaging_requirement_params)
        format.html { redirect_to @packaging_requirement, notice: 'Packaging requirement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @packaging_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packaging_requirements/1
  # DELETE /packaging_requirements/1.json
  def destroy
    @packaging_requirement.destroy
    respond_to do |format|
      format.html { redirect_to packaging_requirements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_packaging_requirement
      @packaging_requirement = PackagingRequirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def packaging_requirement_params
      params.require(:packaging_requirement).permit(:box_capacity, :binding, :auxiliary_board, :tape, :box_sticker, :mark_box, :remark)
    end
end
