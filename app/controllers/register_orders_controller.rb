class RegisterOrdersController < ApplicationController
  before_action :set_register_order, only: [:show, :edit, :update, :destroy]

  # GET /register_orders
  # GET /register_orders.json
  def index
    @register_orders = RegisterOrder.all
  end

  # GET /register_orders/1
  # GET /register_orders/1.json
  def show
  end

  # GET /register_orders/new
  def new
    @register_order = RegisterOrder.new
    @register_order.build_hardware
    @register_order.build_software
    @register_order.build_assembly
    @register_order.build_fitting
    @register_order.build_packaging_requirement
    @register_order.build_packaging_material
  end

  # GET /register_orders/1/edit
  def edit
  end

  # POST /register_orders
  # POST /register_orders.json
  def create
    @register_order = RegisterOrder.new(register_order_params)
    @register_order.build_hardware(register_order_params['hardware_attributes'])
    @register_order.build_software(register_order_params['software_attributes'])
    @register_order.build_assembly(register_order_params['assembly_attributes'])
    @register_order.build_fitting(register_order_params['fitting_attributes'])
    @register_order.build_packaging_requirement(register_order_params['packaging_requirement_attributes'])
    @register_order.build_packaging_material(register_order_params['packaging_material_attributes'])
    respond_to do |format|
      if @register_order.save
        format.html { redirect_to @register_order, notice: 'Register order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @register_order }
      else
        format.html { render action: 'new' }
        format.json { render json: @register_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /register_orders/1
  # PATCH/PUT /register_orders/1.json
  def update
    respond_to do |format|
      if @register_order.update(register_order_params)
        format.html { redirect_to @register_order, notice: 'Register order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @register_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /register_orders/1
  # DELETE /register_orders/1.json
  def destroy
    @register_order.destroy
    respond_to do |format|
      format.html { redirect_to register_orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register_order
      @register_order = RegisterOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_order_params
      params.require(:register_order).permit(:register_orders_id, :user, :time, :version, :product, :color, :quantity, :delivery_time, :customer, :remark, 
      :hardware_attributes => [:cpu, :ram, :flash, :screen, :wireless, :touch_type, :battery_capacity, :connector, :remark], 
      :software_attributes => [:os,:boot_anim, :standby_anim, :poweroff_anim, :language, :software_features, :remark],
      :assembly_attributes => [:shell_color, :spray, :key, :stand, :mark, :numbering_sequence, :remark],
      :fitting_attributes =>  [:adapter, :adapter_sticker, :data_line, :headphone, :tf_card, :holster, :remark],
      :packaging_material_attributes => [:box, :inside_box, :dust_proof_bag, :warranty_card, :quick_help, :help, :serial_number, :ean13_code, :remark],
      :packaging_requirement_attributes => [:box_capacity, :binding, :auxiliary_board, :tape, :box_sticker, :mark_box, :remark])
    end
end
