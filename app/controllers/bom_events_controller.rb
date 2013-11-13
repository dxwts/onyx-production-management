class BomEventsController < ApplicationController
  before_action :set_bom_event, only: [:show, :edit, :update, :destroy]

  # GET /bom_events
  # GET /bom_events.json
  def index
    @bom_events = BomEvent.all
  end

  # GET /bom_events/1
  # GET /bom_events/1.json
  def show
  end

  # GET /bom_events/new
  def new
    @bom_event = BomEvent.new
  end

  # GET /bom_events/1/edit
  def edit
  end

  # POST /bom_events
  # POST /bom_events.json
  def create
    @bom_event = BomEvent.new(bom_event_params)

    respond_to do |format|
      if @bom_event.save
        format.html { redirect_to @bom_event, notice: 'Bom event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bom_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @bom_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bom_events/1
  # PATCH/PUT /bom_events/1.json
  def update
    respond_to do |format|
      if @bom_event.update(bom_event_params)
        format.html { redirect_to @bom_event, notice: 'Bom event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bom_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bom_events/1
  # DELETE /bom_events/1.json
  def destroy
    @bom_event.destroy
    respond_to do |format|
      format.html { redirect_to bom_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bom_event
      @bom_event = BomEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bom_event_params
      params.require(:bom_event).permit(:event)
    end
end
