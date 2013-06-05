# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#build_object_address_attributes_region_id').parent().hide()
  states = $('#build_object_address_attributes_region_id').html()
  $('#build_object_address_attributes_country_id').change ->
    country = $('#build_object_address_attributes_country_id :selected').text()
    options = $(states).filter("optgroup[label=#{country}]").html()
    console.log(options)
    if options
      $('#build_object_address_attributes_region_id').html(options)
      $('#build_object_address_attributes_region_id').parent().show()      
    else
      $('#build_object_address_attributes_region_id').empty()
      $('#build_object_address_attributes_region_id').parent().hide()
      
    #прячем параметры квартиры если выбран пункт продажа дома
jQuery ->
    $('#appartement-fields').hide()
    $("#build_object_type_of_build_object_id").change ->
        if $("#build_object_type_of_build_object_id :selected").val() == "1"
            $('#appartement-fields').show()
        else
            $('#appartement-fields').hide()