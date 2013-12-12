class MaterialesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_materiale, only: [:show, :edit, :update, :destroy]
  WillPaginate.per_page = 15


  # GET /materiales
  # GET /materiales.json
  def index
    # @materiales = Materiale.paginate(:page => params[:page])
    @materiales = Materiale.all
  end

  # GET /materiales/1
  # GET /materiales/1.json
  def show
    @materiales_events = @materiale.materiales_event.paginate(:page => params[:page])
  end

  # GET /materiales/new
  def new
    @materiale = Materiale.new
  end

  # GET /materiales/1/edit
  def edit
  end

  # POST /materiales
  # POST /materiales.json
  def create
    @materiale = Materiale.new(materiale_params)
    @materiale.estimated_quantity = @materiale.quantity
    @event = MaterialesEvent.new
    @event.user = current_user.name
    @event.obj = @materiale.onyx_p_n
    @event.quantity = @materiale.quantity
    @event.event = "创建"
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
     if @materiale.quantity != materiale_params[:quantity].to_i
      @materiale.estimated_quantity = @materiale.estimated_quantity_sum + materiale_params[:quantity]
      @event.obj = @materiale.onyx_p_n
      @event.quantity = materiale_params[:quantity]
      @event.event = "重置"
      @event.user = current_user.name
      @materiale.materiales_event << @event
    end
    respond_to do |format|
      if @materiale.update(materiale_params)
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
    @materiale = Materiale.find(params[:materiale_id])
    @update_quantity = 0
    if params[:materiale_ctrl] === "plus"
      @update_quantity =  params[:quantity].to_i
    elsif params[:materiale_ctrl] === "minus"
      @update_quantity = -params[:quantity].to_i
    end
    @quantity = @materiale.quantity + @update_quantity 
    if @quantity < 0
        @quantity = 0
    end
    @estimated_quantity = @materiale.estimated_quantity_sum + @update_quantity
    @event = MaterialesEvent.new
    @event.obj = @materiale.onyx_p_n
    @event.quantity = @update_quantity
    @event.event =  params[:event]
    @event.remark = params[:remark]
    @event.user = current_user.name
    if @materiale.update_attribute(:estimated_quantity, @estimated_quantity)
    @materiale.materiales_event << @event    
      respond_to do |format|
        format.html { redirect_to materiales_url }
        format.json { head :no_content }
      end
    end
  end
  
  def search_materiales
    column = params[:search_category]
    keyword = params[:search_params]
    @materiales = Materiale.where(column => /#{keyword}/i).all
    respond_to do |format|
      format.html { render "index" }
      format.json { render json: [@materiales, @events] }
      format.js
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materiale
      @materiale = Materiale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materiale_params
      params.require(:materiale).permit(:item, :onyx_p_n, :type, :description, :p_n, :substitute_code, :substitute_p_n, :footprint, :mark,
       :level, :remark, :manufacture, :quantity, :lower_limit, :role, :search_category, :search_params, :datasheets_attributes => [:id, :datasheet, :_destroy], 
       :acknowledgements_attributes => [:id, :acknowledgement, :_destroy], :materiale_manufacture_ships_attributes => [:_id, :price, :delivery_time, :manufacture_id, :_destroy])
    end
  end
