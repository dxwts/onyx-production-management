# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.Materiales = 
  init : ->
    $(document).on "change", "#materiale_manufacture_ships select", (event) ->
      manufacture = []
      $("#materiale_manufacture_ships select").each ->
        console.log  $(this).find('option[value='+$(this).val()+']').text()
        manufacture.push $(this).find('option[value='+$(this).val()+']').text()
        $("#materiale_manufacture").val(manufacture)
        
$(document).ready ->
  Materiales.init()