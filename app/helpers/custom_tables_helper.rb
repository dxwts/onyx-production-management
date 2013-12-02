module CustomTablesHelper
  def column_is_select(table)
    columns = []
    tables = current_user.custom_table.where(:name => table)
    tables.each do |t|
      columns = columns | t.column.split(/,/)
    end
    columns
  end
end
