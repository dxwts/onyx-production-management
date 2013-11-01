class MaterialesEventsController < ApplicationController
  before_action :set_materiales_event, only: [:show, :edit, :update, :destroy]

  # GET /materiales_events
  # GET /materiales_events.json
  def index
    @materiales_events = MaterialesEvent.all
  end

  # GET /materiales_events/1
  # GET /materiales_events/1.json
  def show
  end

  # GET /materiales_events/new
  def new
    @materiales_event = MaterialesEvent.new
  end

  # GET /materiales_events/1/edit
  def edit
  end

  # POST /materiales_events
  # POST /materiales_events.json
  def create
    @materiales_event = MaterialesEvent.new(materiales_event_params)

    respond_to do |format|
      if @materiales_event.save
        format.html { redirect_to @materiales_event, notice: 'Materiales event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @materiales_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @materiales_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materiales_events/1
  # PATCH/PUT /materiales_events/1.json
  def update
    respond_to do |format|
      if @materiales_event.update(materiales_event_params)
        format.html { redirect_to @materiales_event, notice: 'Materiales event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @materiales_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materiales_events/1
  # DELETE /materiales_events/1.json
  def destroy
    @materiales_event.destroy
    respond_to do |format|
      format.html { redirect_to materiales_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materiales_event
      @materiales_event = MaterialesEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materiales_event_params
      params.require(:materiales_event).permit(:user, :obj, :event, :quantity, :remark)
    end
end
