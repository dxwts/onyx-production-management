class MaterialesController < ApplicationController
  before_action :set_materiale, only: [:show, :edit, :update, :destroy, :update_materiale]

  # GET /materiales
  # GET /materiales.json
  def index
    @materiales = Materiale.all
    @events = Event.all
  end

  # GET /materiales/1
  # GET /materiales/1.json
  def show
    @materiales_events = MaterialesEvent.where(:materiale_id => @materiale._id)
  end

  # GET /materiales/new
  def new
    @materiale = Materiale.new
    @types = Type.all
  end

  # GET /materiales/1/edit
  def edit
    @types = Type.all
  end

  # POST /materiales
  # POST /materiales.json
  def create
    @materiale = Materiale.new(materiale_params)
    @event = MaterialesEvent.new
    @event.obj = @materiale.name
    @event.quantity = @materiale.quantity
    @event.event = "create"
    respond_to do |format|
      if @materiale.save
        @materiale.materiales_event << @event
        format.html { redirect_to @materiale, notice: 'Materiale was successfully created.' }
        format.json { render action: 'show', status: :created, location: @materiale }
      else
        format.html { render action: 'new' }
        format.json { render json: @materiale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materiales/1
  # PATCH/PUT /materiales/1.json
  def update
    @event = MaterialesEvent.new
    @event.obj = @materiale.name
    @event.quantity = materiale_params[:quantity]
    @event.event = "rset"
    respond_to do |format|
      if @materiale.update(materiale_params)
        @materiale.materiales_event << @event
        format.html { redirect_to @materiale, notice: 'Materiale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @materiale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materiales/1
  # DELETE /materiales/1.json
  def destroy
    @materiale.destroy
    respond_to do |format|
      format.html { redirect_to materiales_url }
      format.json { head :no_content }
    end
  end


  def update_materiale
    # if params[:ctrl] === "plus"
    #   @quantity = @materiale.quantity + params[:quantity].to_i
    # elsif params[:ctrl] === "minus"
    #   @quantity = @materiale.quantity - params[:quantity].to_i
    #   if @quantity < 0
    #     @quantity = 0
    #   end
    # end
    @event = MaterialesEvent.new
    @event.obj = @materiale.name
    @event.quantity = params[:quantity]
    @event.event =  params[:event]
    @event.remark = params[:remark]
    # if @materiale.update_attribute(:quantity, @quantity)
      @materiale.materiales_event << @event
      respond_to do |format|
        format.html { redirect_to :back }
        format.json { head :no_content }
      # end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materiale
      @materiale = Materiale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materiale_params
      params.require(:materiale).permit(:name, :onyx_p_n, :type, :description, :p_n, :substitute_code, :substitute_p_n, :footprint, :mark, :level, :remark, :manufacture, :quantity, :lower_limit, :role)
    end
  end
