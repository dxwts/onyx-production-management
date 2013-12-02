window.EditTable =
  init : ->
    $(":checkbox").bind 'change', (event) ->
      columns = []
      $(":checkbox").each (index, el) ->
        if $(el).is(':checked')
          columns.push $(el).val()
      console.log columns
      $("#table_columns").val columns

$(document).ready ->
  EditTable.init()
