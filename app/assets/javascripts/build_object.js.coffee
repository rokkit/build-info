# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#Dynamic select
jQuery.fn.extend dynsel: (child) ->
  $(child).parent().hide()
  data = $(child).html()
  $(this).change ->
    filter_value = $("option:selected", this).text()
    options = $(data).filter("optgroup[label='#{filter_value }']").html()
    if options
      $(child).html(options)
      $(child).prepend("<option value=''>Выберите значение</option>").val('');
      $(child).parent().show()      
    else
      $(child).empty()
      $(child).parent().hide()
  child
  
jQuery ->
    $('#build_object_address_attributes_country_id')
    .dynsel($('#build_object_address_attributes_region_id'))
    .dynsel($('#build_object_address_attributes_city_id'))
    .dynsel($('#build_object_address_attributes_distinct_id'))
    .dynsel($('#build_object_address_attributes_street_id'))
    
    
jQuery ->
    $('#build_object_reports_grid_country')
    .dynsel($('#build_object_reports_grid_region'))
    .dynsel($('#build_object_reports_grid_city'))
    .dynsel($('#build_object_reports_grid_distinct'))
    .dynsel($('#build_object_reports_grid_street'))
    
    
jQuery ->
    $('#appartement-fields').hide()
    $("#build_object_type_of_build_object_id").change ->
        if $("#build_object_type_of_build_object_id :selected").text() == "Квартира (Вторичный рынок)"
            $('#appartement-fields').show()
        else
            $('#appartement-fields').hide()
