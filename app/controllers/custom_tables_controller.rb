class CustomTablesController < ApplicationController
  before_action :set_custom_table, only: [:show, :edit, :update, :destroy]

  # GET /custom_tables
  # GET /custom_tables.json
  def index
    @custom_tables = CustomTable.all
  end

  # GET /custom_tables/1
  # GET /custom_tables/1.json
  def show
  end

  # GET /custom_tables/new
  def new
    @custom_table = CustomTable.new
  end

  # GET /custom_tables/1/edit
  def edit
  end

  # POST /custom_tables
  # POST /custom_tables.json
  def create
    @custom_table = CustomTable.new(custom_table_params)

    respond_to do |format|
      if @custom_table.save
        format.html { redirect_to @custom_table, notice: 'Custom table was successfully created.' }
        format.json { render action: 'show', status: :created, location: @custom_table }
      else
        format.html { render action: 'new' }
        format.json { render json: @custom_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_tables/1
  # PATCH/PUT /custom_tables/1.json
  def update
    respond_to do |format|
      if @custom_table.update(custom_table_params)
        format.html { redirect_to @custom_table, notice: 'Custom table was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @custom_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_tables/1
  # DELETE /custom_tables/1.json
  def destroy
    @custom_table.destroy
    respond_to do |format|
      format.html { redirect_to custom_tables_url }
      format.json { head :no_content }
    end
  end
  
  def edit_column
    @table = params[:table_name]
    @columns = @table.constantize::TABLE_MAP
    user = current_user
    if !user.custom_table?
      @custom_table = CustomTable.new
      @custom_table.name = @table
      @custom_table.column = ""
      user.custom_table << @custom_table
    end
    respond_to do |format|
      format.html {render 'edit_table'}
    end
  end
  
  def update_column
    user = current_user
    @name = params[:table_name]
    @columns = params[:table_columns]
    if user.custom_table?
      @custom_table = user.custom_table.find_by(:name => @name)
      if !@custom_table    
        @custom_table = CustomTable.new
        @custom_table.name = @name
      end
    else
      @custom_table = CustomTable.new
      @custom_table.name = @name
    end
    @custom_table.column = @columns
    user.custom_table << @custom_table    
    respond_to do |format|
      format.html {redirect_to materiales_url}
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_table
      @custom_table = CustomTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_table_params
      params[:custom_table]
    end
end
