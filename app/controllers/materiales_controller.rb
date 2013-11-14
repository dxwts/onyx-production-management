class MaterialesController < ApplicationController
  before_action :set_materiale, only: [:show, :edit, :update, :destroy, :update_materiale]
  WillPaginate.per_page = 15


  # GET /materiales
  # GET /materiales.json
  def index
    # create_test_data
    # @materiales = Materiale.paginate(:page => params[:page])
    @materiales = Materiale.all
    @events = Event.all
  end

  # GET /materiales/1
  # GET /materiales/1.json
  def show
    @materiales_events = MaterialesEvent.where(:materiale_id => @materiale._id).paginate(:page => params[:page])
    @total = 0
    @events = MaterialesEvent.where(:materiale_id => @materiale._id)
    @events.each do |event|
      @total = @total + event.quantity
    end
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
    @materiale.estimated_quantity = @materiale.quantity 
    @event = MaterialesEvent.new
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
      @event.obj = @materiale.onyx_p_n
      @event.quantity = materiale_params[:quantity]
      @event.event = "重置"
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
    # if params[:ctrl] === "plus"
    #   @quantity = @materiale.quantity + params[:quantity].to_i
    # elsif params[:ctrl] === "minus"
    #   @quantity = @materiale.quantity - params[:quantity].to_i
    #   if @quantity < 0
    #     @quantity = 0
    #   end
    # end
    @event = MaterialesEvent.new
    @event.obj = @materiale.onyx_p_n
    @event.quantity = params[:quantity]
    @event.event =  params[:event]
    @event.remark = params[:remark]
    # if @materiale.update_attribute(:quantity, @quantity)
    @materiale.materiales_event << @event    
    @materiale.update(:estimated_quantity => @materiale.estimated_quantity + @event.quantity)
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      # end
    end
  end

  def create_test_data
    @materiales = Materiale.all
    if @materiales.size < 100
      i = 0;
      100.times {
        puts i
        @materiale = Materiale.new
        @materiale.item = i+1
        @materiale.save
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materiale
      @materiale = Materiale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materiale_params
      params.require(:materiale).permit(:item, :onyx_p_n, :type, :description, :p_n, :substitute_code, :substitute_p_n, :footprint, :mark, :level, :remark, :manufacture, :quantity, :lower_limit, :role)
    end
  end
