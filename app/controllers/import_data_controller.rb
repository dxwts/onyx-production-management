require 'csv'

class ImportDataController < ApplicationController
  def import_data_view
    DataFile.destroy_all
    render "import_data"
  end

  def upload
    @data_file = DataFile.new
    @data_file.data_file = params[:data_file]
    @reset_database = params[:reset_database]
    if @reset_database.to_i == 1
      Materiale.destroy_all
      MaterialesEvent.destroy_all
    end
    if @data_file.save
      materiale = {}
      csv_text = File.read(Rails.root.to_s+"/public"+@data_file.data_file_url)
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        materiale[:onyx_p_n] = row[1]
        materiale[:type] = row[3]
        materiale[:description] = row[9]
        materiale[:p_n] = row[7]
        materiale[:substitute_code] = row[8]
        materiale[:footprint] = row[6]
        materiale[:mark] = row[10]
        materiale[:manufacture] = row[11]
        insert_data(materiale)
      end
    end

    redirect_to import_data_import_data_view_path
  end

  def insert_data(materiale)
    @materiale = Materiale.new
    @materiale.onyx_p_n = materiale[:onyx_p_n]
    @materiale.type = materiale[:type]
    @materiale.description = materiale[:description]
    @materiale.p_n = materiale[:p_n]
    @materiale.substitute_code = materiale[:substitute_code]
    @materiale.footprint = materiale[:footprint]
    @materiale.mark = materiale[:mark]
    @materiale.manufacture = materiale[:manufacture]
    @materiale.quantity = 1000
    @materiale.estimated_quantity = 1000
    @materiale.level = 1

    if @materiale.save
      @materiale.materiales_event << create_event(@materiale)
    end
  end

  def create_event(materiale)
    @event = MaterialesEvent.new
    @event.user = "system"
    @event.obj = materiale.onyx_p_n
    @event.quantity = materiale.quantity
    @event.event = "创建"
    @event
  end
end
